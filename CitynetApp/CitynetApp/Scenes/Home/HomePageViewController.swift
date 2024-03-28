//
//  HomePageViewController.swift
//  CitynetApp
//
//  Created by Sevar Jafarli on 22.03.24.
//

import UIKit

protocol HomePageDisplayLogic: AnyObject {
    
    func displayLoad(viewModel: HomePage.Load.ViewModel)
}

final class HomePageViewController: UIViewController {
    
    var mainView: HomePageView?
    var interactor: HomePageBusinessLogic?
    var router: (HomePageRoutingLogic & HomePageDataPassing)?
  
    
    // MARK: - Lifecycle Methods

    override func loadView() {
        super.loadView()
        
        
        self.view = mainView
        mainView?.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.navigationController?.navigationItem.leftBarButtonItem = UIBarButtonItem(image: AppAssets.logo.load(), style: .done, target: self, action: nil)
        
        self.navigationController?.navigationItem.rightBarButtonItem = UIBarButtonItem(image: AppAssets.notification.load(), style: .done, target: self, action: nil)
        
        self.load()
    }
  
    
    // MARK: - Public Methods
  
    func load() {
        let request = HomePage.Load.Request()
        interactor?.load(request: request)
    }
}

// MARK: - Display Logic

extension HomePageViewController: HomePageDisplayLogic {
    
    func displayLoad(viewModel: HomePage.Load.ViewModel) {
        //nameTextField.text = viewModel.name
    }
}

// MARK: - View Delegate

extension HomePageViewController: HomePageViewDelegate {
    
}

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        let bottomSheetView = CustomBottomSheetView()
        bottomSheetView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bottomSheetView)

        NSLayoutConstraint.activate([
            bottomSheetView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomSheetView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomSheetView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bottomSheetView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height - 100), // Set desired height
        ])
    }
}

class CustomBottomSheetView: UIView {

    private let bottomSheetClosedHeight: CGFloat = 200 // Set your desired closed height
    private var bottomSheetOpenHeight: CGFloat = UIScreen.main.bounds.height

    private var bottomSheetTopConstraint: NSLayoutConstraint!
    private var isBottomSheetOpen = false

    private lazy var contentView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupBottomSheet()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupBottomSheet()
    }

    private func setupBottomSheet() {
        addSubview(contentView)

        bottomSheetTopConstraint = contentView.topAnchor.constraint(equalTo: bottomAnchor, constant: -bottomSheetClosedHeight)

        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
            contentView.heightAnchor.constraint(equalToConstant: bottomSheetOpenHeight),

            bottomSheetTopConstraint,
        ])

        let gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
        contentView.addGestureRecognizer(gestureRecognizer)

        // Set content size and delegate for scrolling behavior
        contentView.contentSize = CGSize(width: bounds.width, height: 1000) // Set your desired content size
        contentView.delegate = self
    }

    @objc private func handlePanGesture(_ recognizer: UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: self)

        bottomSheetTopConstraint.constant += translation.y

        // Limit the bottom sheet's top constraint to valid ranges
        if bottomSheetTopConstraint.constant < -bottomSheetOpenHeight {
            bottomSheetTopConstraint.constant = -bottomSheetOpenHeight
        } else if bottomSheetTopConstraint.constant > 0 {
            bottomSheetTopConstraint.constant = 0
        }

        recognizer.setTranslation(.zero, in: self)

        if recognizer.state == .ended || recognizer.state == .cancelled {
            let middlePoint = (bottomSheetOpenHeight - bottomSheetClosedHeight) / 2
            if bottomSheetTopConstraint.constant < -middlePoint {
                openBottomSheet()
            } else {
                closeBottomSheet()
            }
        }
    }

    private func openBottomSheet() {
        bottomSheetTopConstraint.constant = -bottomSheetOpenHeight + bottomSheetClosedHeight
        isBottomSheetOpen = true
        animateBottomSheet()
    }

    private func closeBottomSheet() {
        bottomSheetTopConstraint.constant = -bottomSheetClosedHeight
        isBottomSheetOpen = false
        animateBottomSheet()
    }

    private func animateBottomSheet() {
        UIView.animate(withDuration: 0.3) {
            self.layoutIfNeeded()
        }
    }
}

extension CustomBottomSheetView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // Keep the bottom sheet at the top position when scrolled to the top
        if scrollView.contentOffset.y <= 0 {
            bottomSheetTopConstraint.constant = 0
            scrollView.contentOffset = .zero
        }
    }
}
