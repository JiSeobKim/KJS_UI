//
//  SubscribeOnOberveOnViewController.swift
//  KJS_UI
//
//  Created by 김지섭 on 2022/11/12.
//  Copyright © 2022 JS. All rights reserved.
//

import UIKit
import RxSwift

/**
 onNext 등 값이 방출되는 부분들은 Subscription Code 영역
 onNext 등 값을 구독하는 부분들은 Observing Code 영역
 SubscribeOn은 Subscription Code 영역이 실행되는 쓰레드를 정해준다
 SubscribeOn은 여러번 명시하더라도 최초의 실행값으로 정해진다
 ObserveOn은 Operator와 Observing Code 영역이 실행되는 것을 지정
 ObserveOn은 여러번 명시할 경우 그 라인 이후의 Operator들이 명시된 쓰레드에서 적용되며, Observing Code영역은 마지막 ObserveOn에 명시된 쓰레드에서 실행된다.

 */
class SubscribeOnOberveOnViewController: UIViewController {

    private let viewModel: SubscribeOnOberveOnViewModel
    private let disposeBag = DisposeBag()
    private let backgroundQueue = DispatchQueue(label: "backgroundQueue", qos: .background)
    private let defaultQueue = DispatchQueue(label: "backgroundQueue", qos: .default)

    init(viewModel: SubscribeOnOberveOnViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .systemMint
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        Observable<Int>.create { observer in
            print("Subscribtion Start - Thread: \(Thread.current)")
            observer.onNext(1)
            observer.onCompleted()
            print("Subscribtion End - Thread: \(Thread.current)")
            return Disposables.create()
        }
        .subscribe(on: MainScheduler.instance)
        .subscribe(on: ConcurrentDispatchQueueScheduler(queue: defaultQueue))
        .observe(on: ConcurrentDispatchQueueScheduler(queue: defaultQueue))
        .map {
            print("Map 1 - Thread: \(Thread.current)")
            return CGFloat($0)
        }
        .observe(on: ConcurrentDispatchQueueScheduler(queue: backgroundQueue))
        .subscribe(on: MainScheduler.instance)
        .map {
            print("Map 2 - Thread: \(Thread.current)")
            return CGFloat($0 + 1)
        }
        .subscribe(onNext: { value in
            print("Observing - Value: \(value) Thread: \(Thread.current)")
        }).disposed(by: disposeBag)
    }
}
