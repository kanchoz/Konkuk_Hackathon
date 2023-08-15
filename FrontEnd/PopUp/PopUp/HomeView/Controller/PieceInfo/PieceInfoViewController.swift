//
//  PieceInfoViewController.swift
//  PopUp
//
//  Created by 최다경 on 2023/08/14.
//

import UIKit

class PieceInfoViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    

    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var reviewPlate: UIView!
    @IBOutlet var reviewLabel: UILabel!
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var popupDetailInfoLabel: UILabel!
    @IBOutlet var popupInfoLabel: UILabel!
    @IBOutlet var categoryLabel: UILabel!
    @IBOutlet var popupImage: UIImageView!
    @IBOutlet var backBtn: UIButton!
    
    var reviews: [String] = ["볼 거리가 많아요", "이벤트가 있어요", "매장이 넓어요", "웨이팅이 길어요"]
    var emj: [String] = ["eyes", "events", "thumb", "waiting"]
    var pCnt: [String] = ["250명", "250명", "250명", "250명"]
    
    var smrCate: [String] = ["연예인", "연예인", "연예인", "연예인", "연예인"]
    var smrName: [String] = ["여자아이들", "BTS", "세븐틴", "엔믹스", "블랙핑크"]
    var smrImg: [String] = ["Piece1", "Piece2", "Piece3", "Piece1", "Piece2"]
    var smrLoc: [String] = ["서울 송파구", "서울 송파구", "서울 송파구", "서울 송파구", "서울 송파구"]
    
    var isShowingAllReviews = false // 모든 리뷰를 표시할지 여부를 나타내는 변수
    var reviewPlateOriginalHeight: CGFloat = 0 // 리뷰 플레이트의 원래 높이
    var showMoreButton: UIButton! // 더보기 버튼
    var collapseButton: UIButton! // 접기 버튼
    var reviewPlateHeightConstraint: NSLayoutConstraint! // 리뷰 플레이트의 높이 제약 조건
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(backBtn)

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
        
        // 리뷰 플레이트의 원래 높이 저장
        reviewPlateOriginalHeight = reviewPlate.frame.height
        
        print("origin")
        print(reviewPlateOriginalHeight)
        
        // 리뷰 플레이트의 높이 제약 조건 설정
        reviewPlateHeightConstraint = reviewPlate.heightAnchor.constraint(equalToConstant: reviewPlateOriginalHeight)
        reviewPlateHeightConstraint.isActive = true
        

        setupReview()
        
    }
    
    func setupReview(){
        
        // 기존의 서브뷰(subview)들을 제거
        for subview in reviewPlate.subviews {
            subview.removeFromSuperview()
        }

        
        for (index, review) in reviews.enumerated(){
            if(index >= 3){
                break
            }
            // 캡슐 형태의 뷰 생성 및 설정
            let capsuleView = UIView()
            capsuleView.layer.borderColor = UIColor.gray.cgColor
            capsuleView.layer.borderWidth = 1.0
            capsuleView.backgroundColor = UIColor(named: "G3")
            capsuleView.layer.cornerRadius = 20
            capsuleView.translatesAutoresizingMaskIntoConstraints = false

            // reviewPlate에 캡슐 뷰 추가
            reviewPlate.addSubview(capsuleView)

            // 이미지 뷰 생성 및 설정
            let emojiImageView = UIImageView()
            emojiImageView.image = UIImage(named: emj[index])  // emj 배열에서 이미지 가져옴
            emojiImageView.contentMode = .scaleAspectFit
            emojiImageView.translatesAutoresizingMaskIntoConstraints = false
            capsuleView.addSubview(emojiImageView)
            
            // 캡슐 뷰의 제약 조건 설정
            NSLayoutConstraint.activate([
                // emojiImageView 제약 조건
                emojiImageView.leadingAnchor.constraint(equalTo: capsuleView.leadingAnchor, constant: 20),
                emojiImageView.centerYAnchor.constraint(equalTo: capsuleView.centerYAnchor),
                emojiImageView.widthAnchor.constraint(equalToConstant: 14), // 이미지 뷰 너비 설정
                emojiImageView.heightAnchor.constraint(equalToConstant: 14), // 이미지 뷰 높이 설정
                
                
                capsuleView.leadingAnchor.constraint(equalTo: reviewPlate.leadingAnchor, constant: 15),
                capsuleView.topAnchor.constraint(equalTo: reviewPlate.topAnchor, constant: CGFloat(index * 60) + 15), // 60은 캡슐 뷰의 높이와 간격을 합한 값입니다.
                capsuleView.trailingAnchor.constraint(equalTo: reviewPlate.trailingAnchor, constant: -15),
                capsuleView.heightAnchor.constraint(equalToConstant: 41) // 캡슐 뷰의 높이 설정
            ])

            // 캡슐 뷰 안에 들어갈 내용 (예: UILabel) 추가
            let capsuleLabel = UILabel()
            capsuleLabel.text = review
            capsuleLabel.textColor = .white
            capsuleLabel.translatesAutoresizingMaskIntoConstraints = false
            capsuleView.addSubview(capsuleLabel)

            NSLayoutConstraint.activate([
                capsuleLabel.leadingAnchor.constraint(equalTo: emojiImageView.trailingAnchor, constant: 10),
                capsuleLabel.centerYAnchor.constraint(equalTo: capsuleView.centerYAnchor)
            ])
            
            let cntLabel = UILabel()
            cntLabel.text = pCnt[index]
            cntLabel.textColor = .white
            cntLabel.translatesAutoresizingMaskIntoConstraints = false
            capsuleView.addSubview(cntLabel)
            
            NSLayoutConstraint.activate([
                cntLabel.trailingAnchor.constraint(equalTo: capsuleView.trailingAnchor, constant: -20),
                cntLabel.centerYAnchor.constraint(equalTo: capsuleView.centerYAnchor)
            ])
        }
        
        // 리뷰 플레이트의 원래 높이 저장
        reviewPlateOriginalHeight = reviewPlate.frame.height
        
        // 더보기 버튼 생성 및 설정
        showMoreButton = UIButton(type: .system)
        showMoreButton.setImage(UIImage(named: "downArrow"), for: .normal)
        showMoreButton.setTitle("더보기", for: .normal)
        showMoreButton.tintColor = UIColor(named: "G2")
        showMoreButton.addTarget(self, action: #selector(showAllReviews), for: .touchUpInside)
        showMoreButton.translatesAutoresizingMaskIntoConstraints = false
        showMoreButton.semanticContentAttribute = .forceRightToLeft
        reviewPlate.addSubview(showMoreButton)
        
        // 더보기 버튼 제약 조건 설정
        NSLayoutConstraint.activate([
            showMoreButton.topAnchor.constraint(equalTo: reviewPlate.bottomAnchor, constant: -100),
            showMoreButton.centerXAnchor.constraint(equalTo: reviewPlate.centerXAnchor)
        ])
    }
    
    @objc func showAllReviews(){
        
        // 기존의 서브뷰(subview)들을 제거
        for subview in reviewPlate.subviews {
            subview.removeFromSuperview()
        }

        
        let totalReviewsHeight = CGFloat(reviews.count * 100) // 각 캡슐 뷰의 높이가 60이므로 곱하여 총 높이 계산
        reviewPlateHeightConstraint.constant = totalReviewsHeight
        reviewPlateHeightConstraint.isActive = true
        // 더보기 버튼을 숨깁니다.
        showMoreButton.isHidden = true
        
        NSLayoutConstraint.activate([
            reviewPlate.heightAnchor.constraint(equalToConstant: reviewPlateOriginalHeight)
        ])
        reviewPlate.layoutIfNeeded()
        view.layoutIfNeeded()
        
        
        print("jo")
        
        for (index, review) in reviews.enumerated() {
            
            // 캡슐 형태의 뷰 생성 및 설정
            let capsuleView = UIView()
            capsuleView.layer.borderColor = UIColor.gray.cgColor
            capsuleView.layer.borderWidth = 1.0
            capsuleView.backgroundColor = UIColor(named: "G3")
            capsuleView.layer.cornerRadius = 20
            capsuleView.translatesAutoresizingMaskIntoConstraints = false

            // reviewPlate에 캡슐 뷰 추가
            reviewPlate.addSubview(capsuleView)

            // 이미지 뷰 생성 및 설정
            let emojiImageView = UIImageView()
            emojiImageView.image = UIImage(named: emj[index])  // emj 배열에서 이미지 가져옴
            emojiImageView.contentMode = .scaleAspectFit
            emojiImageView.translatesAutoresizingMaskIntoConstraints = false
            capsuleView.addSubview(emojiImageView)
            
            // 캡슐 뷰의 제약 조건 설정
            NSLayoutConstraint.activate([
                // emojiImageView 제약 조건
                emojiImageView.leadingAnchor.constraint(equalTo: capsuleView.leadingAnchor, constant: 20),
                emojiImageView.centerYAnchor.constraint(equalTo: capsuleView.centerYAnchor),
                emojiImageView.widthAnchor.constraint(equalToConstant: 14), // 이미지 뷰 너비 설정
                emojiImageView.heightAnchor.constraint(equalToConstant: 14), // 이미지 뷰 높이 설정
                
                
                capsuleView.leadingAnchor.constraint(equalTo: reviewPlate.leadingAnchor, constant: 15),
                capsuleView.topAnchor.constraint(equalTo: reviewPlate.topAnchor, constant: CGFloat(index * 60) + 15), // 60은 캡슐 뷰의 높이와 간격을 합한 값입니다.
                capsuleView.trailingAnchor.constraint(equalTo: reviewPlate.trailingAnchor, constant: -15),
                capsuleView.heightAnchor.constraint(equalToConstant: 41) // 캡슐 뷰의 높이 설정
            ])

            // 캡슐 뷰 안에 들어갈 내용 (예: UILabel) 추가
            let capsuleLabel = UILabel()
            capsuleLabel.text = review
            capsuleLabel.textColor = .white
            capsuleLabel.translatesAutoresizingMaskIntoConstraints = false
            capsuleView.addSubview(capsuleLabel)

            NSLayoutConstraint.activate([
                capsuleLabel.leadingAnchor.constraint(equalTo: emojiImageView.trailingAnchor, constant: 10),
                capsuleLabel.centerYAnchor.constraint(equalTo: capsuleView.centerYAnchor)
            ])
            
            let cntLabel = UILabel()
            cntLabel.text = pCnt[index]
            cntLabel.textColor = .white
            cntLabel.translatesAutoresizingMaskIntoConstraints = false
            capsuleView.addSubview(cntLabel)
            
            NSLayoutConstraint.activate([
                cntLabel.trailingAnchor.constraint(equalTo: capsuleView.trailingAnchor, constant: -20),
                cntLabel.centerYAnchor.constraint(equalTo: capsuleView.centerYAnchor)
            ])
        }
        collapseButton = UIButton(type: .system)
        collapseButton.setImage(UIImage(named: "upperArrow"), for: .normal)
        collapseButton.semanticContentAttribute = .forceRightToLeft
        collapseButton.setTitle("접기", for: .normal)
        collapseButton.tintColor = UIColor(named: "G2")
        collapseButton.addTarget(self, action: #selector(collapse), for: .touchUpInside)
        collapseButton.translatesAutoresizingMaskIntoConstraints = false
        reviewPlate.addSubview(collapseButton)
        
        // 더보기 버튼 제약 조건 설정
        NSLayoutConstraint.activate([
            collapseButton.topAnchor.constraint(equalTo: reviewPlate.bottomAnchor, constant: -50),
            collapseButton.centerXAnchor.constraint(equalTo: reviewPlate.centerXAnchor)
        ])
    }
    
    @objc func collapse(){
        collapseButton.isHidden = true
        setupReview()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func backBtnTapped(_ sender: Any) {
        dismiss(animated: false)
    }
    
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return smrImg.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PieceInfoCollectionViewCell", for: indexPath) as! PieceInfoCollectionViewCell
        cell.pieceImg.image = UIImage(named: smrImg[indexPath.row])
        cell.nameLabel.text = smrName[indexPath.row]
        cell.locationLabel.text = smrLoc[indexPath.row]
        cell.ceteLabel.text = smrCate[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let cellWidth = 100 // 셀 너비 계산 (좌우 간격 15씩)
            let cellHeight = 192 // 셀 높이는 컬렉션뷰 높이와 같게 설정
            return CGSize(width: cellWidth, height: cellHeight)
        }
    
}


