//
//  ViewPostViewController.swift
//  Thoughts
//
//  Created by Afraz Siddiqui on 7/11/21.
//

import UIKit

class ViewPostViewController: UITabBarController, UITableViewDataSource, UITableViewDelegate {

    private let post: BlogPost
    private let isOwnedByCurrentUser: Bool

    init(post: BlogPost, isOwnedByCurrentUser: Bool = false) {
        self.post = post
        self.isOwnedByCurrentUser = isOwnedByCurrentUser
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self,
                       forCellReuseIdentifier: "cell")
        table.register(PostHeaderTableViewCell.self,
                       forCellReuseIdentifier: PostHeaderTableViewCell.identifier)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self

        if !isOwnedByCurrentUser {
            IAPManager.shared.logPostViewed()
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }

    // Table

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3 // title, iamge, text
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        switch index {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.selectionStyle = .none
            cell.textLabel?.numberOfLines = 0
            cell.textLabel?.font = .systemFont(ofSize: 25, weight: .bold)
            cell.textLabel?.text = post.title
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PostHeaderTableViewCell.identifier,
                                                           for: indexPath) as? PostHeaderTableViewCell else {
                fatalError()
            }
            cell.selectionStyle = .none
            cell.configure(with: .init(imageUrl: post.headerImageUrl))
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.selectionStyle = .none
            cell.textLabel?.numberOfLines = 0
            cell.textLabel?.text = post.text
            return cell
        default:
            fatalError()
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let index = indexPath.row
        switch index {
        case 0:
            return UITableView.automaticDimension
        case 1:
            return 250
        case 2:
            return UITableView.automaticDimension
        default:
            return UITableView.automaticDimension
        }
    }
}
