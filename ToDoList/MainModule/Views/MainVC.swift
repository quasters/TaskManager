//
//  ViewController.swift
//  ToDoList
//
//  Created by Наиль Буркеев on 06.08.2022.
//

import UIKit
import RxSwift

class MainVC: UIViewController {
    var viewModel: MainVMProtocol?
    
    private var headerView: HeaderView?
    private var daySegment: CustomSegmentControl?
    private var listView: TaskListView?
    private var bottomButtonView: BottomButtonView?
    
    private let disposeBag = DisposeBag()
    
    private let sideIndent: Double = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setHeader()
        setTabs()
        setList()
        setAddButton()
    }
       
    
    
// MARK: Set up views
    private func setHeader() {
        headerView = HeaderView()
        guard let headerView = headerView else { return }
        
        self.view.addSubview(headerView)
        setHeaderConstraints()
        
        headerView.configure()
    }
    
    private func setTabs() {
        daySegment = CustomSegmentControl()
        guard let daySegment = daySegment else { return }
        
        let segmentHeight = 26.0

        daySegment.layer.cornerRadius = segmentHeight / 2
        daySegment.layer.masksToBounds = true
        
        self.view.addSubview(daySegment)
        setTabsConstraints(height: segmentHeight)
        
        let tabs = ["Today", "Upcoming", "Task Done", "Failed"]
        let width = self.view.frame.width - (sideIndent * 2)
        daySegment.configurate(tabTitles: tabs, height: segmentHeight, width: width)
    }
    
    private func setList() {
        listView = TaskListView()
        guard let listView = listView else { return }
        
        self.view.addSubview(listView)
        setListConstraints()
        
        listView.configure()
    }
    
    private func setAddButton() {
        bottomButtonView = BottomButtonView()
        guard let bottomButtonView = bottomButtonView else { return }
        
        self.view.addSubview(bottomButtonView)
        setAddButtonConstraints()
        
        bottomButtonView.configure()
        
        bottomButtonView.button.rx.tap.bind { [weak self] in
            self?.viewModel?.swiftchToCreatorModule()
        }.disposed(by: disposeBag)
    }
    
    
    
// MARK: - Constraints
    private func setHeaderConstraints() {
        guard let headerView = headerView else { return }
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: sideIndent),
            headerView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -sideIndent),
            headerView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
    
    private func setTabsConstraints(height: Double) {
        guard let daySegment = daySegment else { return }
        guard let headerView = headerView else { return }
        
        daySegment.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            daySegment.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 20),
            daySegment.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: sideIndent),
            daySegment.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -sideIndent),
            daySegment.heightAnchor.constraint(equalToConstant: height)
        ])
    }
    
    private func setListConstraints() {
        guard let listView = listView else { return }
        guard let daySegment = daySegment else { return }
        
        listView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            listView.topAnchor.constraint(equalTo: daySegment.bottomAnchor, constant: 27),
            listView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            listView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: sideIndent),
            listView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -sideIndent),
        ])
    }
    
    private func setAddButtonConstraints() {
        guard let bottomButtonView = bottomButtonView else { return }

        bottomButtonView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bottomButtonView.heightAnchor.constraint(equalToConstant: 36),
            bottomButtonView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1/3),
            bottomButtonView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            bottomButtonView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

