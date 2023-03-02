//
//  LoginViewController2.swift
//  PageControl
//
//  Created by Humberto Rodrigues on 02/03/23.
//

import UIKit

class LoginViewController: UIPageViewController {
    
    var scrollView = UIScrollView()
    var pageControl = UIPageControl()
    var backgroundView = [UIView(), UIView(), UIView()]
    var orangeColors: [OrangeColors] = [.lightOrange, .mediumOrange, .darkOrange]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupScrollView()
        setupPageControl()
        addViewToScroll()
    }
    
    func setupScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.delegate = self
        scrollView.isPagingEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func setupPageControl(){
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.numberOfPages = backgroundView.count
        pageControl.currentPage = 0
        pageControl.tintColor = .white
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.currentPageIndicatorTintColor = .black
        view.addSubview(pageControl)
        
        NSLayoutConstraint.activate([
            pageControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -16),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func addViewToScroll() {
        for i in 0..<backgroundView.count {
            let secondView = backgroundView[i]
            secondView.translatesAutoresizingMaskIntoConstraints = false
            secondView.backgroundColor = orangeColors[i].color
            scrollView.addSubview(secondView)
            
            NSLayoutConstraint.activate([
                secondView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                secondView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                secondView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: view.bounds.width * CGFloat(i)),
                secondView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -view.bounds.width * CGFloat(backgroundView.count - 1 - i)),
                secondView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
                secondView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            ])
        }
    }
}

extension LoginViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard scrollView.contentOffset.x != 0, scrollView.frame.size.width != 0 else {
               print("erro de tamanho, igual a 0")
               return
           }
           let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
           pageControl.currentPage = Int(pageNumber)
    }
}
