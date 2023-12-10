//
//  GeneralViewController.swift
//  ui_kit
//
//  Created by Tensor Lab on 12/10/23.
//

import UIKit

class GeneralViewController: UIViewController {
    @IBOutlet var tblProject: UITableView!

    var projectList: [Project]?

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "General Testing Projects"

        // change title color
        let textChangeColor = [NSAttributedString.Key.foregroundColor: UIColor.purple]
        navigationController?.navigationBar.titleTextAttributes = textChangeColor
        navigationController?.navigationBar.largeTitleTextAttributes = textChangeColor

        projectList = projectList.decode(from: generalProjectData.toJSONString)

        tblProject.delegate = self
        tblProject.dataSource = self
    }
}

// MARK: - Table Data Source and Delegate

extension GeneralViewController: UITableViewDelegate, UITableViewDataSource {
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
            let calculatorVC = TextFieldDelegateViewController.getController(to: .TextField)

            navigationController?.pushViewController(calculatorVC, animated: true)

        default:
            print("Can't go")
        }
    }
}
