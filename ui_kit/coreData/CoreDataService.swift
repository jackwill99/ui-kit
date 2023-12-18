//
//  FavoriteMovieDataService.swift
//  ui_kit
//
//  Created by Tensor Lab on 12/10/23.
//

import CoreData
import Foundation

class CoreDataService {
    private var objectContext: NSManagedObjectContext?

    init() {
        initCoreDataStack()
    }

    private func initCoreDataStack() {
        // Create an instance of NSPersistentContainer for designed Data Model
        let container = NSPersistentContainer(name: "CoreData")

        // Invoke initialization by calling loadPersistentStores method
        container.loadPersistentStores(completionHandler: { [weak self] _, error in

            // Check if operation is finished with success.
            if let error = error {
                fatalError("Unable to load persistent stores: \(error)")
            } else {
                self?.objectContext = container.viewContext
            }
        })
    }

    private func getManagedObject(for entityName: String) -> NSManagedObject? {
        if let context = objectContext {
            guard let desc = NSEntityDescription.entity(forEntityName: entityName, in: context) else {
                return nil
            }

            let object = NSManagedObject(entity: desc, insertInto: objectContext)

            return object
        }

        return nil
    }

    private func fetchRequest(for entityName: String, predicate: NSPredicate?) -> NSFetchRequest<NSFetchRequestResult> {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)

        fetchRequest.returnsObjectsAsFaults = false

        if let nsPredicate = predicate {
            fetchRequest.predicate = nsPredicate
        }

        return fetchRequest
    }

    // MARK: - Insert Operation

    public func insert(for entityName: String, checkExist: NSPredicate? = nil, operation: (_ object: NSManagedObject) -> ()) -> Bool? {
        if let context = objectContext {
            if let object = getManagedObject(for: entityName) {
                // Check the inserted data existed or not
                if checkExist != nil {
                    let result = read(for: entityName, predicate: checkExist)

                    if (result?.first) != nil {
                        print("Data is duplicate")
                        return false
                    }
                }

                operation(object)

                do {
                    try context.save()
                    return true
                } catch {
                    print("Inserting object is failed")
                    print(error.localizedDescription)
                    return nil
                }
            }
        }

        return false
    }

    // MARK: - Read Operation

    public func read(for entityName: String, predicate: NSPredicate? = nil) -> [NSFetchRequestResult]? {
        if let context = objectContext {
            let fetchRequest = fetchRequest(for: entityName, predicate: predicate)

            do {
                let result = try context.fetch(fetchRequest)
                return result

            } catch {
                print("Fetching objects is failed")
                print(error.localizedDescription)
                return nil
            }
        }

        return nil
    }

    // MARK: - Update Operation

    public func update(for entityName: String, predicate: NSPredicate, operation: (_ object: [NSFetchRequestResult]) -> ()) -> Bool? {
        if let context = objectContext {
            let fetchRequest = fetchRequest(for: entityName, predicate: predicate)

            do {
                let result = try context.fetch(fetchRequest)
                operation(result)

                try context.save()
                return true
            } catch {
                print("Updating objects is failed")
                print(error.localizedDescription)
                return nil
            }
        }

        return false
    }

    // MARK: - Delete Operation

    public func delete(for entityName: String, predicate: NSPredicate? = nil, isAll: Bool = false) -> Bool? {
        if let context = objectContext {
            let fetchRequest = fetchRequest(for: entityName, predicate: predicate)

            do {
                if isAll {
                    print("delete all")
                    let deleteRequest = NSBatchDeleteRequest(
                        fetchRequest: fetchRequest
                    )

                    // Specify the result of the NSBatchDeleteRequest
                    // should be the NSManagedObject IDs for the
                    // deleted objects
                    deleteRequest.resultType = .resultTypeObjectIDs

                    // Perform the batch delete
                    let batchDelete = try context.execute(deleteRequest) as? NSBatchDeleteResult

                    guard let deleteResult = batchDelete?.result
                        as? [NSManagedObjectID]
                    else { return nil }

                    let deletedObjects: [AnyHashable: Any] = [
                        NSDeletedObjectsKey: deleteResult
                    ]

                    // Merge the delete changes into the managed
                    // object context
                    NSManagedObjectContext.mergeChanges(
                        fromRemoteContextSave: deletedObjects,
                        into: [context]
                    )

                } else {
                    let result = try context.fetch(fetchRequest)

                    if let match = result.first as? NSManagedObject {
                        context.delete(match)
                        try context.save()
                    }
                }

                return true

            } catch {
                print("Deleting\(isAll ? " all" : "") objects is failed")
                print(error.localizedDescription)
                return nil
            }
        }

        return false
    }
}
