//
//  BasicAsyncAwaitVC.swift
//  KJS_UI
//
//  Created by 김지섭 on 2022/11/13.
//  Copyright © 2022 JS. All rights reserved.
//

import UIKit
import SnapKit

class BasicAsyncAwaitVC: UIViewController {

    private let resultText: String = """
    정리
    """
    private let naviTitle: String = ""
    private let viewModel: BasicAsyncAwaitVM
    private lazy var textView: UITextView = {
        let v = UITextView()
        v.font = .preferredFont(forTextStyle: .caption1)
        v.text = resultText
        v.textColor = .label
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .clear
        return v
    }()

    init(viewModel: BasicAsyncAwaitVM) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .systemGroupedBackground
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        testCode()
    }

}

// MARK: - Private
private extension BasicAsyncAwaitVC {

    func setUI() {
        title = self.naviTitle
        view.addSubview(textView)
        textView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    func testCode() {
        // Insert Test Code
    }
}
