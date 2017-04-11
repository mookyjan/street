//
//  SPCentredTableView.swift
//  SampleProject
//
//  Created by Zeeshan Haider on 29/02/2016.
//  Copyright © 2016 DevBatch. All rights reserved.
//
import UIKit
class SPCentredTableView: UITableView {

    override func reloadData() {
        super.reloadData()
        self.centerTableViewContentsIfNeeded()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.centerTableViewContentsIfNeeded()
    }

    func centerTableViewContentsIfNeeded() {
        let totalHeight: CGFloat = CGRectGetHeight(self.bounds)
        let contentHeight: CGFloat = self.contentSize.height
            //If we have less content than our table frame then we can center
        let contentCanBeCentered: Bool = contentHeight < totalHeight
        if contentCanBeCentered {
            self.contentInset = UIEdgeInsetsMake(ceil(totalHeight / 2.0 - contentHeight / 2.0), 0, 0, 0)
        }
        else {
            self.contentInset = UIEdgeInsetsZero
        }
    }
}