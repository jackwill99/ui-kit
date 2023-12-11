//
//  ViewController.swift
//  ui_kit
//
//  Created by Tensor Lab on 11/25/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var tblProject: UITableView!

    var projectList: [Project]?

    let coreDataService = CoreDataService()

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "UIKit Example Projects"

        // change title color
        let textChangeColor = [NSAttributedString.Key.foregroundColor: UIColor.purple]
        navigationController?.navigationBar.titleTextAttributes = textChangeColor
        navigationController?.navigationBar.largeTitleTextAttributes = textChangeColor

        projectList = projectList.decode(from: projectData.toJSONString)

        tblProject.delegate = self
        tblProject.dataSource = self
    }
}

// MARK: - Table Data Source and Delegate

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projectList?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tbl = tableView.dequeueReusableCell(withIdentifier: "ProjectTableViewCell", for: indexPath) as! ProjectTableViewCell

        if let project = projectList?[indexPath.row] {
            tbl.config(img: project.img, title: project.title, desc: project.description)
        }

        return tbl
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let calculatorVC = CalculatorViewController.getController(to: .Calculator)

            // Present the view controller
//            calculatorVC.modalTransitionStyle = .crossDissolve
//            calculatorVC.modalPresentationStyle = .fullScreen
//            present(calculatorVC, animated: true)

            // Navigate the view controller
            navigationController?.pushViewController(calculatorVC, animated: true)
        case 1:
            let ticketVC = TicketViewController.getController(to: .Ticket)
            navigationController?.pushViewController(ticketVC, animated: true)
        case 2:
            let movieVC = MovieViewController.getController(to: .Movie)
            movieVC.coreDataService = coreDataService
            navigationController?.pushViewController(movieVC, animated: true)
        case 3:
            let movieCltVC = MovieCollectionViewController.getController(to: .Movie)
            movieCltVC.coreDataService = coreDataService
            navigationController?.pushViewController(movieCltVC, animated: true)
        default:
            print("Can't go")
        }
    }
}
