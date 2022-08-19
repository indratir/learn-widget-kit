//
//  MyOrdersViewController.swift
//  LearnWidgetKit
//
//  Created by Indra Tirta Nugraha on 14/08/22.
//

import UIKit

final class MyOrdersViewController: UIViewController {

    private lazy var tableView: UITableView = .init(frame: .zero)
    private lazy var presenter: MyOrderPresenter = .init()
    private var dataSource: [MyOrderItemViewParam] = []
    
    override func loadView() {
        super.loadView()
        
        title = "My Orders"
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        setupConstraints()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        UserDefaults.standard.removeObject(forKey: "date_format")
        setupNavigationBar()
        setupTableView()
        loadData()
    }
    
    private func setupNavigationBar() {
        let rightBarButtonItem: UIBarButtonItem = .init(barButtonSystemItem: .add, target: self, action: #selector(onClickAddButton))
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    private func setupConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    private func setupTableView() {
        tableView.register(UINib(nibName: "MyOrdersItemCell", bundle: nil), forCellReuseIdentifier: "MyOrdersItemCell")
        tableView.dataSource = self
    }
    
    private func loadData() {
        presenter.onLoadDataSource { [weak self] dataSource in
            guard let weakSelf = self else { return }
            
            weakSelf.dataSource = dataSource
            weakSelf.tableView.reloadData()
        }
    }
    
    @objc private func onClickAddButton() {
        presenter.onAddOrder { [weak self] in
            guard let weakSelf = self else { return }
            
            weakSelf.loadData()
        }
    }

}

extension MyOrdersViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete, let itemId = dataSource[indexPath.row].id {
            presenter.onDeleteOrder(id: itemId) { [weak self] in
                guard let weakSelf = self else { return }
                
                weakSelf.loadData()
            }
        }
    }
}

extension MyOrdersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyOrdersItemCell") as? MyOrdersItemCell else { return .init() }
        
        let item: MyOrderItemViewParam = dataSource[indexPath.row]
        cell.configure(item)
        
        return cell
    }
}
