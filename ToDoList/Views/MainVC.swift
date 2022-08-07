//
//  ViewController.swift
//  ToDoList
//
//  Created by Наиль Буркеев on 06.08.2022.
//

import UIKit

class MainVC: UIViewController {
    var viewModel: MainVMProtocol?
    
    private var headerView: HeaderView?
    private var daySegment: TasksSegmentControl?
    private var listView: TaskListView?
    private var bottomButtonView: BottomButtonView?
    
    private let sideIndent: Double = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setHeader()
        setTabs()
        setList()
        setAddButton()
    }
        
    private func setHeader() {
        headerView = HeaderView()
        guard let headerView = headerView else { return }
        self.view.addSubview(headerView)

        headerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: sideIndent),
            headerView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -sideIndent),
            headerView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        headerView.configure()
    }
    
    private func setTabs() {
        daySegment = TasksSegmentControl()
        guard let daySegment = daySegment else { return }
        
        let segmentHeight = 26.0

        daySegment.layer.cornerRadius = segmentHeight / 2
        daySegment.layer.masksToBounds = true
        self.view.addSubview(daySegment)
        
        guard let headerView = headerView else { return }
        daySegment.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            daySegment.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 20),
            daySegment.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: sideIndent),
            daySegment.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -sideIndent),
            daySegment.heightAnchor.constraint(equalToConstant: segmentHeight)
        ])
        
        let tabs = ["Today", "Upcoming", "Task Done", "Failed"]
        let width = self.view.frame.width - (sideIndent * 2)
        daySegment.configurate(tabTitles: tabs, cornerRadius: segmentHeight / 2, width: width)
    }
    
    private func setList() {
        listView = TaskListView()
        guard let listView = listView else { return }
        self.view.addSubview(listView)
        
        guard let daySegment = daySegment else { return }
        listView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            listView.topAnchor.constraint(equalTo: daySegment.bottomAnchor, constant: 27),
            listView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            listView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: sideIndent),
            listView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -sideIndent),
        ])
        
        listView.configure()
    }
    
    private func setAddButton() {
        bottomButtonView = BottomButtonView()
        guard let bottomButtonView = bottomButtonView else { return }
        
        let height: Double = 36
        bottomButtonView.height = height
        
        self.view.addSubview(bottomButtonView)
        
        bottomButtonView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bottomButtonView.heightAnchor.constraint(equalToConstant: height),
            bottomButtonView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1/3),
            bottomButtonView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            bottomButtonView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        bottomButtonView.configure()
    }
}

