//
//  ViewController.swift
//  PopUp
//
//  Created by 이동현 on 2023/08/08.
//

import UIKit
import AVFoundation

// MARK: - CV := CollectionView, TV := TableView



class ViewController: UIViewController, UISheetPresentationControllerDelegate, DataSendDelegate, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    @IBOutlet var similarView: UIImageView!
    @IBOutlet var filterSV: UIScrollView!
    @IBOutlet var popUpStoreCV: UICollectionView! //이번 주 핫한 팝업 CV
    @IBOutlet var visitedPieceCV: UICollectionView! //내가 모은 방문 조각 CV
    @IBOutlet var storeListCV: UICollectionView! //팝업 스토어 목록 CV (전체, 캐릭터, 연예인, 패션, 푸드)
    @IBOutlet var categoryCV: UICollectionView!
    
    var category = ["전체", "캐릭터", "연예인", "패션", "푸드", "주류", "기타"] //카테고리 7종류
    var categoryIndex = 0 //현재 선택되어있는 카테고리의 index
    var popUpStoreIndex = 0 // 현재 선택되어 있는 storeList index. 항상 categoryIndex와 같아야함
    var filters = ["오픈 예정", "마감 임박"]
    
    var selectedFilters: Set<String> = []
    weak var dataSendDelegate: DataSendDelegate?
    
    var is_filterBtn_exist : Bool = false
    
    let buttonWidth: CGFloat = 73
    let buttonHeight: CGFloat = 33
    let buttonSpacing: CGFloat = 10
    var selectedButton: UIButton?
    
    override func loadView() {
        super.loadView()
        let defaults = UserDefaults.standard
        if !(defaults.value(forKey: "isLoggedIn")! as! Bool){ // 로그인 되지 않은 회원의 경우 로그인 화면으로 이동시킴
            print("login status: false")
            print("move to login page")
            
            let sb = UIStoryboard(name: "LoginView", bundle: nil)
            let loginVC = sb.instantiateViewController(withIdentifier: "afterLoginVC") as! AfterLoginViewController
            loginVC.modalTransitionStyle = .coverVertical
            loginVC.modalPresentationStyle = .fullScreen
            
            self.present(loginVC, animated: false, completion: nil)
        }
        else{
//            print(defaults.value(forKey: "UserId"))
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        popUpStoreCV.dataSource = self
        popUpStoreCV.delegate = self
        visitedPieceCV.dataSource = self
        visitedPieceCV.delegate = self
        storeListCV.dataSource = self
        storeListCV.delegate = self
        categoryCV.dataSource = self
        categoryCV.delegate = self
        
        storeListCV.decelerationRate = .fast
        storeListCV.isPagingEnabled = false
        
        filterSV.delegate = self
        
        similarView.isUserInteractionEnabled = true

        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewTapped(_:)))
        similarView.addGestureRecognizer(tapGestureRecognizer)

        
        
        setupSVBtn()
    }
    
    @objc func viewTapped(_ sender: UITapGestureRecognizer) {
        // 뷰를 탭했을 때 실행될 코드
        print("tapped")
        if let nextVC = storyboard?.instantiateViewController(withIdentifier: "RecommandPopupViewController") as? RecommandPopupViewController {
            nextVC.modalPresentationStyle = .overFullScreen
            present(nextVC, animated: true, completion: nil)
        }
    }

    
    func setupSVBtn(){
        filterSV.subviews.forEach { $0.removeFromSuperview() }
        // 버튼들을 가로로 스크롤하며 추가합니다.
        var contentWidth: CGFloat = 20
        
        for filter in filters {
            let button = UIButton()
            button.backgroundColor = UIColor(named: "BackGround")
            button.setTitleColor(UIColor.white, for: .normal)
            button.setTitle(filter, for: .normal)
            button.layer.cornerRadius = buttonHeight / 2
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.white.cgColor

            // 동적으로 버튼의 너비 설정
            let titleWidth = filter.width(withConstrainedHeight: buttonHeight, font: button.titleLabel?.font ?? UIFont.systemFont(ofSize: 14))
            let buttonWidth = max(titleWidth + 20, self.buttonWidth) // 최소 너비를 버튼의 원래 너비인 73으로 설정
            button.frame = CGRect(x: contentWidth, y: 24, width: buttonWidth, height: buttonHeight)

            button.titleLabel?.font = UIFont.systemFont(ofSize: 14)

            if(filter != "오픈 예정" && filter != "마감 임박"){
                let CancleBtn = UIImage(named: "CancleBtn")
                button.setImage(CancleBtn, for: .normal)
                button.imageEdgeInsets = UIEdgeInsets(top: 0, left: titleWidth , bottom: 0, right: -15)
                button.titleEdgeInsets = UIEdgeInsets(top: 0, left: -30, bottom: 0, right: 0)
            }

            filterSV.addSubview(button)

            // 버튼 클릭 이벤트에 대한 동작 정의
            button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)


            contentWidth += buttonWidth + buttonSpacing
        }
        
       
        
        let button = UIButton()
        button.backgroundColor = UIColor(named: "BackGround")
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitle("필터", for: .normal)
        button.layer.cornerRadius = buttonHeight / 2
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.frame = CGRect(x: contentWidth, y: 24, width: buttonWidth, height: buttonHeight)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        let filterImage = UIImage(named: "filter")
        button.setImage(filterImage, for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 45, bottom: 0, right: -3)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: -25, bottom: 0, right: 8)
        let imageSize = CGSize(width: 25, height: 25)
        filterSV.addSubview(button)
        button.addTarget(self, action: #selector(filterBtnTapped), for: .touchUpInside)
        // UIScrollView의 콘텐츠 크기를 버튼들에 맞게 조정합니다.
        contentWidth += buttonWidth + buttonSpacing
        filterSV.contentSize = CGSize(width: contentWidth, height: buttonHeight)
    }
    
    func setupSVBtnWithoutFilterBtn(){
        // 버튼들을 가로로 스크롤하며 추가합니다.
        var contentWidth: CGFloat = 20
        
        for filter in filters { // 예시로 5개의 버튼을 추가합니다.
            let button = UIButton()
            button.backgroundColor = UIColor(named: "BackGround")
            button.setTitleColor(UIColor.white, for: .normal)
            button.setTitle(filter, for: .normal)
            button.layer.cornerRadius = buttonHeight / 2
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.white.cgColor
            button.frame = CGRect(x: contentWidth, y: 24, width: buttonWidth, height: buttonHeight)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            
            if(filter != "오픈 예정" && filter != "마감 임박"){
                let CancleBtn = UIImage(named: "CancleBtn")
                button.setImage(CancleBtn, for: .normal)
                button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 45, bottom: 0, right: -8)
                button.titleEdgeInsets = UIEdgeInsets(top: 0, left: -25, bottom: 0, right: 8)
            }
            
            filterSV.addSubview(button)
            
            // 버튼 클릭 이벤트에 대한 동작 정의
            button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

            
            contentWidth += buttonWidth + buttonSpacing
        }
        
        
        // UIScrollView의 콘텐츠 크기를 버튼들에 맞게 조정합니다.
        filterSV.contentSize = CGSize(width: contentWidth, height: buttonHeight)
    }

    func didReceiveData(data: Set<String>) {
        print("selected")
        for filter in data{
            print(filter)
            filters.append(filter)
        }
        setupSVBtn()
    }
    
    @objc func buttonTapped(sender: UIButton) {
        if let title = sender.titleLabel?.text {
            print("Button tapped: \(title)")
            
            if(sender.titleLabel?.text != "오픈 예정" && sender.titleLabel?.text != "마감 임박"){
                filters.removeAll { $0 == title }
                filters.removeAll { $0 == "필터" }
                for filter in filters {
                    print(filter)
                }
                setupSVBtn()
            }
            
            // 버튼이 클릭되었을 때 테두리와 글자색을 DarkGray로 변경
            else if(sender.layer.borderColor == UIColor(named: "Gray")?.cgColor){
                sender.layer.borderColor = UIColor.white.cgColor
                sender.setTitleColor(UIColor.white, for: .normal)
            }else{
                sender.layer.borderColor = UIColor(named: "Gray")?.cgColor
                sender.setTitleColor(UIColor(named: "Gray"), for: .normal)
            }
            
        }
    }
    
    @objc func filterBtnTapped(sender: UIButton) {
        print("filter tapped")
        let filterVC = self.storyboard?.instantiateViewController(identifier: "PopupFilterViewController") as! PopupFilterViewController
        filterVC.dataSendDelegate = self
        filterVC.selectedFilters = self.selectedFilters
        filterVC.modalPresentationStyle = .pageSheet
        
        if #available(iOS 15.0, *) {
            if let sheet = filterVC.sheetPresentationController {
                sheet.delegate = self
                //지원할 크기 지정
                sheet.detents = [.medium(), .large()]
                //뒷 배경 흐리게 안함
                sheet.largestUndimmedDetentIdentifier = .medium
                //시트 상단에 그래버 표시
                sheet.prefersGrabberVisible = true
            }
        } else {
            print("ios 15 이상만 지원")
        }
        present(filterVC, animated: true, completion: nil)
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //navigation bar가 스크롤 시에도 색상이 변하지 않도록 함
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(named: "Background")
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
        print("appear")
    }
    
    //검색 버튼 눌림
    @IBAction func searchBtnTapped(_ sender: Any) {
        let searchSB = UIStoryboard(name: "SearchView", bundle: nil)
        let searchDetailVC = searchSB.instantiateViewController(identifier: "searchDetailVC") as! SearchDetailViewController
        
        searchDetailVC.modalPresentationStyle = .fullScreen
        present(searchDetailVC, animated: true, completion: nil)
    }
    
    @IBAction func notificationBtnTapped(_ sender: Any) {
        
        let notificationVC = self.storyboard?.instantiateViewController(withIdentifier: "notificationVC") as! NotificationViewController
        
        notificationVC.modalPresentationStyle = .fullScreen
        self.present(notificationVC, animated: true, completion: nil)
    }
    
    //내가 모은 방문조각 버튼 눌림
    
    @IBAction func myPieceBtnTapped(_ sender: Any) {
        tabBarController?.selectedIndex = 2
    }
    
    
    @IBAction func cameraBtnTapped(_ sender: UIButton) {
//        let modalVC = storyboard!.instantiateViewController(withIdentifier: "QRViewController") as! QRViewController
//        modalVC.modalPresentationStyle = .custom
//        modalVC.transitioningDelegate = self
//        present(modalVC, animated: true, completion: nil)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            self.present(imagePicker, animated: true, completion: nil)
        } else {
            // 카메라 사용 불가능한 경우 처리
            print("카메라 사용이 불가능합니다.")
        }
    }
    
}

// MARK: - collectionView delegate, dataSource
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == popUpStoreCV{
            return 3
            
        }
        else if collectionView == visitedPieceCV{
            return 10
        }
        else if collectionView == categoryCV{
            return 7
        }
        else{
            return 7
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == popUpStoreCV{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopUpStoreCVCell", for: indexPath) as! PopUpStoreCVCell
            print("팝업 셀 출력")
            return cell
        }
        else if collectionView == visitedPieceCV{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VisitedPieceCVCell", for: indexPath) as! VisitedPieceCVCell
            print("방문 셀 출력")
            return cell
        }
        else if collectionView == storeListCV{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoreListCVCell", for: indexPath) as! StoreListCVCell
            print("리스트 셀 출력")
            cell.storeListTV.reloadData()
            return cell
        }
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCVCell", for: indexPath) as! CategoryCVCell
            cell.categoryLabel.text = category[indexPath.item]
            if indexPath.item == categoryIndex{
                cell.categoryLabel.textColor = UIColor(named: "White")
            }else{
                cell.categoryLabel.textColor = UIColor(named: "DarkGray")
            }
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoryCV {
            // 선택한 셀의 텍스트 색상 변경
            let selectedCell = collectionView.cellForItem(at: indexPath) as! CategoryCVCell
            categoryIndex = indexPath.item
            selectedCell.categoryLabel.textColor = UIColor(named: "White")
            
            storeListCV.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
        }
        storeListCV.reloadData()
        categoryCV.reloadData()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if collectionView == categoryCV {
            // 선택 해제된 셀의 텍스트 색상 변경
            if let cell = collectionView.cellForItem(at: indexPath) as? CategoryCVCell {
                cell.categoryLabel.textColor = UIColor(named: "DarkGray")
            }
            storeListCV.reloadData()
            categoryCV.reloadData()
        }
    }
}


// MARK: - scrollView delegate
extension ViewController: UIScrollViewDelegate{
    //storeListCV에 paging을 적용하는 함수
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
            guard let layout = self.storeListCV.collectionViewLayout as? UICollectionViewFlowLayout else { return }
            
            // CollectionView Item Size
            let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
            
            // 이동한 x좌표 값과 item의 크기를 비교 후 페이징 값 설정
            let estimatedIndex = scrollView.contentOffset.x / cellWidthIncludingSpacing
            let index: Int
            
            // 스크롤 방향 체크
            // item 절반 사이즈 만큼 스크롤로 판단하여 올림, 내림 처리
            if velocity.x > 0 {
                index = Int(ceil(estimatedIndex))
            } else if velocity.x < 0 {
                index = Int(floor(estimatedIndex))
            } else {
                index = Int(round(estimatedIndex))
            }
            // 위 코드를 통해 페이징 될 좌표 값을 targetContentOffset에 대입
            targetContentOffset.pointee = CGPoint(x: CGFloat(index) * cellWidthIncludingSpacing, y: 0)
        }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        //storeList를 스와이프 할때마다 category를 같이 바꿔줌
        if scrollView == storeListCV {
            let visibleIndexPaths = storeListCV.indexPathsForVisibleItems
            
            if let cell = categoryCV.cellForItem(at: IndexPath(item: categoryIndex, section: 0)) as? CategoryCVCell {
                cell.categoryLabel.textColor = UIColor(named: "DarkGray")
            }
            
            if let curIndexPath = visibleIndexPaths.first {
                // collectionView1의 선택 조정
                categoryCV.selectItem(at: curIndexPath, animated: true, scrollPosition: .centeredHorizontally)
                categoryIndex = curIndexPath.item
                if let cell = categoryCV.cellForItem(at: IndexPath(item: categoryIndex, section: 0)) as? CategoryCVCell {
                    cell.categoryLabel.textColor = UIColor(named: "White")
                }
                storeListCV.reloadData()
                categoryCV.reloadData()
            }
        }
    }
    
    
    
}

extension String {
    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        return ceil(boundingBox.width)
    }
}

extension ViewController: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return CustomPresentationController(presentedViewController: presented, presenting: presenting)
    }
}
