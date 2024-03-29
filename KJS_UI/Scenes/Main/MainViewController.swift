//
//  ViewController.swift
//  KJS_UI
//
//  Created by kimjiseob on 2020/02/24.
//  Copyright © 2020 JS. All rights reserved.
//

import UIKit
import SnapKit

protocol MainViewEventListener {
    
    func viewDidDisappear()
    func didTapCell(_ indexPath: IndexPath)
}

final class MainViewController: UIViewController {

    enum Metric {

        enum Padding {

            static let sidePadding: CGFloat = 15
            static let itemSpacing: CGFloat = 8
        }
    }

    private var viewModel: MainViewModelAvailable?

    private var tableView: UITableView?
    private let cellID: String = "cell"

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        if tableView == nil {
            setTableView()
        }
    }

    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        setUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUI()
    }

    private func setUI() {
        title = "HOME"
        view.backgroundColor = .systemGroupedBackground
    }
}

// MARK: - Set tableView
private extension MainViewController {

    private func setTableView() {
        configureTableView()
        layoutTableView()
    }

    private func configureTableView() {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        tableView.delegate = self
        tableView.rowHeight = 50

        self.tableView = tableView
        viewModel?.dataSource = MainDiffableDataSource.make(cellID: cellID, tableView: tableView)
    }

    private func layoutTableView() {
        guard let tableView else { return }
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.directionalEdges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}


// MARK: - TableView Delegate
extension MainViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.didTapCell(indexPath)
    }
}
