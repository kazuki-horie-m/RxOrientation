//
//  UIApplication+Rx.swift
//  RxOrientation
//
//  Created by Meng Li on 2018/11/12.
//  Copyright © 2018 MuShare. All rights reserved.
//

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import UIKit
import RxSwift
import RxCocoa

extension RxSwift.Reactive where Base: UIApplication {
    
    public var statusBarOrientation: Observable<UIInterfaceOrientation> {
        return NotificationCenter.default.rx.notification(UIApplication.didChangeStatusBarOrientationNotification).map { _ in
            UIApplication.shared.statusBarOrientation
        }.distinctUntilChanged()
    }
    
    public var isPortrait: Observable<Bool> {
        return statusBarOrientation.map {
            $0.isPortrait
        }.distinctUntilChanged()
    }
    
    public var isLandscape: Observable<Bool> {
        return statusBarOrientation.map {
            $0.isLandscape
        }.distinctUntilChanged()
    }
}
