//
//  Presenter.swift
//  TiCTacToe
//
//  Created by sunlubo on 2017/2/10.
//  Copyright © 2017年 slb. All rights reserved.
//

import Foundation

protocol Presenter {
    func viewDidLoad()
    func viewWillAppear()
    func viewDidAppear()
    func viewWillDisappear()
    func viewDidDisappear()
}

extension Presenter {
    func viewDidLoad() {}
    func viewWillAppear() {}
    func viewDidAppear() {}
    func viewWillDisappear() {}
    func viewDidDisappear() {}
}
