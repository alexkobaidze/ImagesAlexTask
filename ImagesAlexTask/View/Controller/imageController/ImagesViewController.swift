//
//  ImagesViewController.swift
//  ImagesAlexTask
//
//  Created by Alex on 06.08.22.
//

import UIKit

class ImagesViewController: UIViewController {

    var viewModel: ViewModelProtocol?
    
    private let tableView: UITableView =  {
        let tableView = UITableView()
        tableView.register(ImageCell.self, forCellReuseIdentifier: "ImageCell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        let updateCallBack: () -> Void = {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        viewModel = ImagesViewModel(updateCallBack: updateCallBack)
        viewModel?.loadData()
        view.addSubview(tableView)
        tableView.backgroundColor = .black
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
}

extension ImagesViewController: UITableViewDelegate {
    
}

extension ImagesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.getObject().count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath) as? ImageCell else {
            return UITableViewCell()
            
        }
        cell.configure(viewModelGetObject: viewModel?.getViewModel(index: indexPath.row))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
           let detailVC = ImageDetailViewController()
        detailVC.configure(viewModelGetObject: viewModel?.getViewModel(index: indexPath.row))
              self.navigationController?.pushViewController(detailVC, animated: true)
    
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 100
    }
}

