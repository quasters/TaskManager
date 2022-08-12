//
//  TaskTypeCell.swift
//  ToDoList
//
//  Created by Наиль Буркеев on 12.08.2022.
//

import UIKit

final class TaskTypeCell: UITableViewCell {
    private let tabs = ["Basic", "Urgent", "Important"]
    private let typeSegment = CustomSegmentControl() // MainModule/Views/
    
    private let sideIndent: Double = 20
    
    override func layoutSubviews() {
        super.layoutSubviews()
        typeSegment.configurate(tabTitles: tabs, height: self.bounds.height - sideIndent, width: self.bounds.width - (sideIndent * 2))
    }
    
    func configure() {
        self.selectionStyle = .none
        self.contentView.isUserInteractionEnabled = true

        self.addSubview(typeSegment)
        setConstraints()
    }
    
    private func setConstraints() {
        typeSegment.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            typeSegment.topAnchor.constraint(equalTo: self.topAnchor, constant: sideIndent),
            typeSegment.leftAnchor.constraint(equalTo: self.leftAnchor, constant: sideIndent),
            typeSegment.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -sideIndent),
            typeSegment.heightAnchor.constraint(equalTo: self.heightAnchor)
        ])
    }
}
