//
//  DiscoverMidCell.swift
//  JingDong
//
//  Created by zhangshaoyu on 17/6/23.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

import UIKit

let reuseDiscoverMidCell:String = "DiscoverMidCell"

class DiscoverMidCell: DiscoverCell {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

    // MARK: - 视图
    override func setUI()
    {
        self.height = DiscoverMidCell.heightForCell()
        
        self.productImageView = UIImageView(frame: CGRectMake((self.width - originXY - 90.0), originXY, 90.0, 90.0))
        self.contentView.addSubview(self.productImageView!)
        self.productImageView!.backgroundColor = UIColor.clearColor()
        
        var currentView:UIView = self.productImageView!
        
        self.productTitleLabel = UILabel(frame: CGRectMake(originXY, originXY, (self.width - currentView.width - originXY * 3), heightTitle))
        self.contentView.addSubview(self.productTitleLabel!)
        self.productTitleLabel!.font = UIFont.systemFontOfSize(14.0)
        self.productTitleLabel!.textColor = UIColor.blackColor()
        self.productTitleLabel!.textAlignment = .Left
        self.productTitleLabel!.numberOfLines = 2;
        
        currentView = self.productTitleLabel!
        
        self.authorImageView = UIImageView(frame: CGRectMake(currentView.left, currentView.bottom, sizeImage, sizeImage))
        self.contentView.addSubview(self.authorImageView!)
        
        currentView = self.authorImageView!
        
        self.authorNameLabel = UILabel(frame: CGRectMake((currentView.right + originXY), currentView.top, 100.0, currentView.height))
        self.contentView.addSubview(self.authorNameLabel!)
        self.authorNameLabel!.font = UIFont.systemFontOfSize(10.0)
        self.authorNameLabel!.textColor = UIColor.lightGrayColor()
        self.authorNameLabel!.textAlignment = .Left
        
        currentView = self.authorNameLabel!
        
        self.productReadLabel = UILabel(frame: CGRectMake((currentView.right + originXY), currentView.top, 100.0, currentView.height))
        self.contentView.addSubview(self.productReadLabel!)
        self.productReadLabel!.font = UIFont.systemFontOfSize(10.0)
        self.productReadLabel!.textColor = UIColor.lightGrayColor()
        self.productReadLabel!.textAlignment = .Left
        
        currentView = self.productReadLabel!
        
        self.productNumberLabel = UILabel(frame: CGRectMake((self.width - 100.0 - originXY), currentView.top, 100.0, currentView.height))
        self.contentView.addSubview(self.productNumberLabel!)
        self.productNumberLabel!.font = UIFont.systemFontOfSize(10.0)
        self.productNumberLabel!.textColor = UIColor.lightGrayColor()
        self.productNumberLabel!.textAlignment = .Left
        
        currentView = self.productNumberLabel!
        
        let lineView = UIView(frame: CGRectMake(0.0, (currentView.bottom + originXY - 0.5), self.width, 0.5))
        self.contentView.addSubview(lineView)
        lineView.backgroundColor = UIColor.lightGrayColor()
    }
    
    /// cell高度
    override class func heightForCell() -> CGFloat
    {
        return (90.0 + 10.0 * 2)
    }
    
    /// 刷新cell数据
    override func reloadDataWithModel(model data:DiscoverModel)
    {
        if let model:DiscoverModel = data
        {
            let imageStr:String = model.productImages.first! as String
            self.productImageView!.image = UIImage.imageWithURL(imageStr)
            
            let title:String = model.productTitle
            self.productTitleLabel!.text = title
            
            let imageHeaderStr:String = model.productAuthorImage
            let imageHeaderUrl:NSURL = NSURL(string: imageHeaderStr)!
            let imageHeaderData:NSData = NSData(contentsOfURL: imageHeaderUrl)!
            self.authorImageView!.image = UIImage(data: imageHeaderData)
            
            let name:String = model.productAuthorName
            self.authorNameLabel!.text = name
            
            let read:String = String(" \(model.productRead)次阅读")
            self.productReadLabel!.text = read
            
            let number:String = String("\(model.productNumber)件宝贝")
            self.productNumberLabel!.text = number
            
            let widthName = name.textSize(size: CGSizeMake(100.0, heightLabel), font: self.authorNameLabel!.font).width
            self.authorNameLabel!.width = widthName
            
            let widthRead = read.textSize(size: CGSizeMake(100.0, heightLabel), font: self.productReadLabel!.font).width
            self.productReadLabel!.left = self.authorNameLabel!.right
            self.productReadLabel!.width = widthRead
        }
    }
}