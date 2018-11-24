//
//  TwitterAlert.swift
//  TwitterAlert
//
//  Created by 築山朋紀 on 2018/11/24.
//  Copyright © 2018 tomoki. All rights reserved.
//

import UIKit

open class TwitterAlert: UIView {
    private let backgroundView: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.black
        button.layer.opacity = 0.2
        return button
    }()
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 10
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.clipsToBounds = true
        return view
    }()
    
    private let bgBundleView = UIView()
    
    private let bundleView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 221 / 255, green: 221 / 255, blue: 221 / 255, alpha: 1)
        view.layer.cornerRadius = 5
        return view
    }()
    
    private let tableView = UITableView()
    
    private let cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("キャンセル", for: .normal)
        button.backgroundColor = UIColor(red: 221 / 255, green: 221 / 255, blue: 221 / 255, alpha: 1)
        button.setTitleColor(UIColor.black, for: .normal)
        button.addTarget(self, action: #selector(TwitterAlert.back), for: .touchUpInside)
        return button
    }()
    
    private var items = [String]()
    
    required override public init(frame: CGRect) {
        super.init(frame: frame)
        
        items = ["リツイート", "コメントを付けてリツイート"]
        
        tableView.tableFooterView = UIView()
        tableView.register(AlertTableViewCell.self, forCellReuseIdentifier: "AlertCell")
        tableView.separatorStyle = .none
        tableView.rowHeight = 60
        tableView.isScrollEnabled = false
        tableView.dataSource = self
        tableView.delegate = self
        
        backgroundView.addTarget(self, action: #selector(TwitterAlert.back), for: .touchUpInside)
        self.addSubview(backgroundView)
        self.addSubview(containerView)
        containerView.addSubview(tableView)
        containerView.addSubview(cancelButton)
        containerView.addSubview(bgBundleView)
        bgBundleView.addSubview(bundleView)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        
        setUp()
    }
    
    private func setUp() {
        
        let cellCount = items.count + 1
        let height: CGFloat = CGFloat(60 * cellCount + 30)
        let zero: CGFloat = 0
        
        backgroundView.frame = self.bounds
        containerView.frame = CGRect(x: zero, y: backgroundView.frame.height, width: backgroundView.frame.width, height: height)
        tableView.frame = CGRect(x: 0, y: 30, width: Int(containerView.frame.width), height: 60 * items.count)
        cancelButton.frame = CGRect(x: 5, y: tableView.frame.maxY + 5, width: containerView.frame.width - 10, height: 50)
        cancelButton.layer.cornerRadius = 25
        bgBundleView.frame = CGRect(x: 0, y: 0, width: containerView.frame.width, height: 30)
        bundleView.frame = CGRect(x: 0, y: 0, width: 100, height: 10)
        bundleView.center = bgBundleView.center
        willAnimation()
    }
    
    private func willAnimation() {
        UIView.animate(withDuration: 0.5, animations: {
            self.containerView.frame.origin.y = self.frame.height - self.containerView.frame.height
        })
    }
    
    @objc private func back() {
        UIView.animate(withDuration: 0.5, animations: {
            self.containerView.frame.origin.y += self.backgroundView.frame.maxY
        }, completion: { _ in
//            self.dismiss(animated: false, completion: nil)
            print("戻る")
        })
    }
}

extension TwitterAlert: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlertCell", for: indexPath) as! AlertTableViewCell
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
}

extension TwitterAlert: UITableViewDelegate {
    private func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
