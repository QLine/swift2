//
//  ViewController.swift
//  swift2
//
//  Created by junashi on 16/2/19.
//  Copyright © 2016年 junashi. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate{

    var myTableView : UITableView?;
    var isOpend : Bool?;
    lazy var dataArray : NSMutableArray = {
        let array = NSMutableArray();
        return array;
    }();
    lazy var selectIndex : NSIndexPath = {
        let index = NSIndexPath(forRow: 1000, inSection: 1000);
        return index;
    }();
    lazy var stateArray : NSMutableArray = {
        let array = NSMutableArray();
        return array;
    }();
        
    override func viewDidLoad() {
        super.viewDidLoad()
        creatTable();
        registerCell();
        dataSource();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func creatTable(){
        self.myTableView = UITableView(frame: self.view.bounds, style: UITableViewStyle.Plain);
        self.myTableView?.delegate = self;
        self.myTableView?.dataSource = self;
        self.myTableView?.separatorStyle = UITableViewCellSeparatorStyle.None;
        self.view .addSubview(self.myTableView!);
    }
    func registerCell(){
        self.myTableView?.registerNib(UINib(nibName: "swift_TableViewCell", bundle: nil), forCellReuseIdentifier: "cell");
        self.myTableView?.registerNib(UINib(nibName: "swift_TwoTableViewCell", bundle: nil), forCellReuseIdentifier: "Two_cell");
    }
    
    func dataSource(){
        for var index = 0 ; index < 3 ; index++ {
            let array : NSMutableArray = NSMutableArray();
            for var i = 0 ; i < Int(arc4random() % 10 + 2 ) ; i++ {
                array.addObject(String(format: "%i我又出来卖西瓜了%i", index, i));
            }
            self.dataArray.addObject(array);
        }
    }
    
    // 代理方法
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath == self.selectIndex && self.isOpend == true {
            let cell : swift_TwoTableViewCell = tableView.dequeueReusableCellWithIdentifier("Two_cell", forIndexPath: indexPath) as! swift_TwoTableViewCell;
            return cell;
        } else {
            let cell : swift_TableViewCell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! swift_TableViewCell;
            let dataArr : NSArray = self.dataArray[indexPath.section] as! NSArray;
            cell.setMyLableValue(String(dataArr[indexPath.row]));
            return cell;
        }
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let array : NSArray = self.dataArray[section] as! NSArray;
        if self.isOpend == true && section == self.selectIndex.section {
            return array.count + 1;
        } else {
            return array.count;
        }
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.dataArray.count;
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true);
        let path = NSIndexPath(forRow: indexPath.row + 1, inSection: indexPath.section);
        self.selectIndex = path;
        self.isOpend = true;
        tableView.beginUpdates();
        tableView.insertRowsAtIndexPaths([path], withRowAnimation: UITableViewRowAnimation.None);
        tableView.endUpdates();
    }
}

