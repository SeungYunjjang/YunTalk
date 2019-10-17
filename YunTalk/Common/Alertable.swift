//
//  Alertable.swift
//  puts
//
//  Created by 익스 김승윤 on 02/01/2019.
//  Copyright © 2019 컴퓨터. All rights reserved.
//

import UIKit

protocol Alertable {
    //    func showAlert()
}

extension Alertable where Self: UIViewController {
    func showAlert(title: String? = nil,
                   message: String? = nil,
                   confirm: String,
                   cancel: String? = nil,
                   confirmAction: ((UIAlertAction) -> Void)? = nil,
                   cancelAction: ((UIAlertAction) -> Void)? = nil
        ) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.isModalInPopover = true
        
        if let action = cancelAction {
            alert.addAction(UIAlertAction(title: cancel, style: .cancel, handler: action))
        }
        alert.addAction(UIAlertAction(title: confirm, style: .default, handler: confirmAction))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showAlert(title: String? = nil,
                   message: String? = nil,
                   confirm: LocalizedKeySet,
                   cancel: LocalizedKeySet? = nil,
                   confirmAction: ((UIAlertAction) -> Void)? = nil,
                   cancelAction: ((UIAlertAction) -> Void)? = nil
        ) {
        
        let alert = UIAlertController(title: title?.localized, message: message?.localized, preferredStyle: .alert)
        alert.isModalInPopover = true
        
        if let action = cancelAction {
            alert.addAction(UIAlertAction(title: cancel?.localized, style: .cancel, handler: action))
        }
        alert.addAction(UIAlertAction(title: confirm.localized, style: .default, handler: confirmAction))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showAlert(title: LocalizedKeySet? = nil,
                   message: LocalizedKeySet? = nil,
                   confirm: LocalizedKeySet,
                   cancel: LocalizedKeySet? = nil,
                   confirmAction: ((UIAlertAction) -> Void)? = nil,
                   cancelAction: ((UIAlertAction) -> Void)? = nil
        ) {
        
        let alert = UIAlertController(title: title?.localized, message: message?.localized, preferredStyle: .alert)
        alert.isModalInPopover = true
        
        if let action = cancelAction {
            alert.addAction(UIAlertAction(title: cancel?.localized, style: .cancel, handler: action))
        }
        alert.addAction(UIAlertAction(title: confirm.localized, style: .default, handler: confirmAction))
        self.present(alert, animated: true, completion: nil)
    }
    
    
}//alertalble
