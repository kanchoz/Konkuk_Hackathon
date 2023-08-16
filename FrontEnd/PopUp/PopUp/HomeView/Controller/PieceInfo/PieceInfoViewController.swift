//
//  PieceInfoViewController.swift
//  PopUp
//
//  Created by 최다경 on 2023/08/14.
//

import UIKit

class PieceInfoViewController: UIViewController, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var reviewLabel: UILabel!
    @IBOutlet var popupDetailInfoLabel: UILabel!
    @IBOutlet var popupInfoLabel: UILabel!
    @IBOutlet var categoryLabel: UILabel!
    @IBOutlet var popupImage: UIImageView!
    @IBOutlet var backBtn: UIButton!
    //리뷰 관련 components
    @IBOutlet var reviewViews: [UIView]!
    @IBOutlet var reviewIcons: [UIImageView]!
    @IBOutlet var reviewContents: [UILabel]!
    @IBOutlet var reviewCnt: [UILabel]!
    
    
    var id: Int = 0
    var storeDetailStruct: StoreDetail?
    
    //리뷰 갯수
    var reviewCount = 0
    var reviews: [String] = ["볼 거리가 많아요", "이벤트가 있어요", "매장이 넓어요", "웨이팅이 길어요", "친절해요"]
    var pCnt: [String] = ["250명", "25명", "2250명", "1250명", "5250명"]
    
    var smrCate: [String] = ["연예인", "연예인", "연예인", "연예인", "연예인"]
    var smrName: [String] = ["여자아이들", "BTS", "세븐틴", "엔믹스", "블랙핑크"]
    var smrImg: [String] = ["Piece1", "Piece2", "Piece3", "Piece1", "Piece2"]
    var smrLoc: [String] = ["서울 송파구", "서울 송파구", "서울 송파구", "서울 송파구", "서울 송파구"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(backBtn)
        reviewCount = reviews.count
        // UIButton 생성 및 설정
        backBtn.setTitle("", for: .normal)
        backBtn.setImage(UIImage(named: "backBtn"), for: .normal)
        self.view.bringSubviewToFront(backBtn)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 10 // 아이템 사이의 간격 설정
        collectionView.collectionViewLayout = layout
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        setUp()
    }

    func setUp(){
        fillReiviewView()
        hideAllReview()
        showReview()
    }
    
    func fillReiviewView(){
        for i in 0..<reviewCount{
            if reviews[i] == "볼 거리가 많아요"{
                reviewIcons[i].image = UIImage(named: "eyesIcon")
            }
            else if reviews[i] == "이벤트가 있어요"{
                reviewIcons[i].image = UIImage(named: "eventIcon")
            }
            else if reviews[i] == "매장이 넓어요"{
                reviewIcons[i].image = UIImage(named: "goodIcon")
            }
            else if reviews[i] == "웨이팅이 길어요"{
                reviewIcons[i].image = UIImage(named: "waitingIcon")
            }
            else{
                reviewIcons[i].image = UIImage(named: "kindIcon")
            }
            
            reviewContents[i].text = reviews[i]
            reviewCnt[i].text = pCnt[i]

        }
    }
    
    //모든 리뷰를 보여주지 않음
    func hideAllReview(){
        for i in 0..<10{
            reviewViews[i].isHidden = true
        }
    }
    
    //처음에는 최대 3개의 리뷰를 보여줌
    func showReview(){
        let temp:Int = min(reviewCount, 3)
        for i in 0..<temp{
            reviewViews[i].isHidden = false
        }
    }

    //더보기 버튼 누르면 활성화. 모든 리뷰를 보여줌
    func maximizeReview(){
        for i in 0..<reviewCount{
            reviewViews[i].isHidden = false
        }
    }
    
    //접기 버튼 누르면 활성화. 4번째 리뷰부터 활성화 되어 있다면 접어줌
    func minimizieReview(){
        hideAllReview()
        showReview()
    }
    
    
    @IBAction func reviewBtnTapped(_ sender: UIButton) {
        print("접기 펼치기 버튼 눌림")
        if sender.titleLabel!.text! == "더보기"{
            print("더보기 -> 접기")
            sender.setTitle("접기", for: .normal)
            sender.setImage(UIImage(named: "ReviewUp"), for: .normal)
            maximizeReview()
        }
        else{
            print("접기 -> 더보기")
            sender.setImage(UIImage(named: "ReviewDown"), for: .normal)
            sender.setTitle("더보기", for: .normal)
            minimizieReview()
        }
    }
    
    @IBAction func backBtnTapped(_ sender: Any) {
        dismiss(animated: true)
    }
        
}

// MARK: - collectionView delegate, dataSource
extension PieceInfoViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PieceInfoCollectionViewCell", for: indexPath) as! PieceInfoCollectionViewCell
        cell.pieceImg.image = UIImage(named: "\(StoreArr.arr1[indexPath.row].id)Thumbnail")
        cell.nameLabel.text = StoreArr.arr1[indexPath.row].name
        cell.locationLabel.text = StoreArr.arr1[indexPath.row].location
        cell.ceteLabel.text = StoreArr.arr1[indexPath.row].category
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = 100 // 셀 너비 계산 (좌우 간격 15씩)
        let cellHeight = 192 // 셀 높이는 컬렉션뷰 높이와 같게 설정
        return CGSize(width: cellWidth, height: cellHeight)
    }
}
