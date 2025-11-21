//
//  BaseViewController.swift
//  sopt_37th_1weekSeminar
//
//  Created by 송성용 on 11/8/25.
//

import UIKit

/// 공통 기능을 제공하는 베이스 뷰컨트롤러
public class BaseViewController: UIViewController {
    
    // MARK: - UI Components
    
    /// 로딩 인디케이터
    public let loadingIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.color = .systemGray
        indicator.hidesWhenStopped = true
        return indicator
    }()
    
    // MARK: - Lifecycle
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLoadingIndicator()
    }
    
    // MARK: - Setup
    
    private func setupLoadingIndicator() {
        view.addSubview(loadingIndicator)
        loadingIndicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loadingIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    // MARK: - Helper Methods
    
    /// Alert을 표시하는 헬퍼 메서드
    /// - Parameters:
    ///   - title: Alert 제목
    ///   - message: Alert 메시지
    ///   - completion: Alert이 닫힐 때 실행할 클로저
    public func showAlert(title: String, message: String, completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default) { _ in
            completion?()
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

