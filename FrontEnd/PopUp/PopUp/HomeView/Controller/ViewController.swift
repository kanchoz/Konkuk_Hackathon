//
//  ViewController.swift
//  PopUp
//
//  Created by 이동현 on 2023/08/08.
//

import UIKit

// MARK: - CV := CollectionView, TV := TableView

class ViewController: UIViewController {

    @IBOutlet var popUpStoreCV: UICollectionView! //이번 주 핫한 팝업 CV
    @IBOutlet var visitedPieceCV: UICollectionView! //내가 모은 방문 조각 CV
    @IBOutlet var storeListCV: UICollectionView! //팝업 스토어 목록 CV (전체, 캐릭터, 연예인, 패션, 푸드)
    @IBOutlet var categoryCV: UICollectionView!
    
    var category = ["전체", "캐릭터", "연예인", "패션", "푸드", "주류", "기타"] //카테고리 7종류
    var categoryIndex = 0 //현재 선택되어있는 카테고리의 index
    var popUpStoreIndex = 0 // 현재 선택되어 있는 storeList index. 항상 categoryIndex와 같아야함
    
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //navigation bar가 스크롤 시에도 색상이 변하지 않도록 함
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(named: "Background")
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
    }
    
    @IBAction func searchBtnTapped(_ sender: Any) {
        let searchDetailVC = self.storyboard?.instantiateViewController(identifier: "searchDetailVC") as! SearchDetailViewController
        
        searchDetailVC.modalPresentationStyle = .fullScreen
        self.present(searchDetailVC, animated: true, completion: nil)
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
