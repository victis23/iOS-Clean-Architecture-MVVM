//
//  LoadingView.swift
//  ExampleMVVM
//
//  Created by Oleh Kudinov on 28/03/2020.
//

import UIKit

public class LoadingView {

    internal static var spinner: UIActivityIndicatorView?

	public static func show(currentView: UIView?) {
        DispatchQueue.main.async {
            NotificationCenter.default.addObserver(self, selector: #selector(update), name: UIDevice.orientationDidChangeNotification, object: nil)
			if spinner == nil, let view = currentView {
                let frame = UIScreen.main.bounds
                let spinner = UIActivityIndicatorView(frame: frame)
                spinner.backgroundColor = UIColor.black.withAlphaComponent(0.2)
				spinner.style = .large
				spinner.color = .white
                view.addSubview(spinner)

                spinner.startAnimating()
                self.spinner = spinner
            }
        }
    }

    public static func hide() {
        DispatchQueue.main.async {
            guard let spinner = spinner else { return }
            spinner.stopAnimating()
            spinner.removeFromSuperview()
            self.spinner = nil
        }
    }

    @objc public static func update() {
        DispatchQueue.main.async {
            if spinner != nil {
                hide()
				show(currentView: nil)
            }
        }
    }
}
