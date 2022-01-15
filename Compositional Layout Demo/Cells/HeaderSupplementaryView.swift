//
//  Created by Mustafa Yusuf on 15/01/22.
//

import UIKit.UICollectionView

final class HeaderSupplementaryView: UICollectionReusableView, ReusableView {
    
    static var defaultReuseIdentifier: String = String(describing: HeaderSupplementaryView.self)
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Header for Section"
        label.font = .preferredFont(forTextStyle: .title2).withWeight(.bold)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        backgroundColor = .systemBackground
        addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constant.interItem),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constant.interItem),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constant.intraItem),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: Constant.intraItem),
        ])
    }
}
