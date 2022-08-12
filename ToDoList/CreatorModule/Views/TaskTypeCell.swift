//
//  TaskTypeCell.swift
//  ToDoList
//
//  Created by Наиль Буркеев on 12.08.2022.
//

import UIKit

class TaskTypeCell: UITableViewCell {
    private let tabs = ["Basic", "Urgent", "Important"]
    private let typeSegment = CustomSegmentControl() // MainModule/Views/
    
    override func layoutSubviews() {
        super.layoutSubviews()
        typeSegment.configurate(tabTitles: tabs, height: self.bounds.height, width: self.bounds.width)
    }
    
    func configure() {
        self.selectionStyle = .none

        self.addSubview(typeSegment)
        setConstraints()
    }
    
    func setConstraints() {
        typeSegment.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            typeSegment.widthAnchor.constraint(equalTo: self.widthAnchor),
            typeSegment.heightAnchor.constraint(equalTo: self.heightAnchor)
        ])
    }
}
