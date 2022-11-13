//___FILEHEADER___

import UIKit
import SnapKit

class ___FILEBASENAMEASIDENTIFIER___: UIViewController {

    private let resultText: String = """
    정리
    """
    private let naviTitle: String = ""
    private let viewModel: ___VARIABLE_productName___VM
    private lazy var textView: UITextView = {
        let v = UITextView()
        v.font = .preferredFont(forTextStyle: .caption1)
        v.text = resultText
        v.textColor = .label
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .clear
        return v
    }()

    init(viewModel: ___VARIABLE_productName___VM) {
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
private extension ___FILEBASENAMEASIDENTIFIER___ {

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
