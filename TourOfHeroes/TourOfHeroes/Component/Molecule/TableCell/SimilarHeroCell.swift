//
//  SimilarHeroCell.swift
//  TourOfHeroes
//
//  Created by Nayanda Haberty (ID) on 24/08/20.
//  Copyright © 2020 Nayanda Haberty (ID). All rights reserved.
//

import Foundation

import NamadaLayout
import UIKit

class SimilarHeroCell: TableMoleculeCell {
    
    // MARK: View
    lazy var label: UILabel = build {
        $0.text = "Similar Hero"
        $0.font = .boldSystemFont(ofSize: .x16)
        $0.numberOfLines = 1
        $0.lineBreakMode = .byTruncatingTail
        $0.textColor = .black
    }
    lazy var hStack: UIStackView = build {
        $0.alignment = .fill
        $0.distribution = .equalCentering
        $0.spacing = .x16
    }
    lazy var similarHero1: PhotoWithDetailCell = .init()
    lazy var similarHero2: PhotoWithDetailCell = .init()
    lazy var similarHero3: PhotoWithDetailCell = .init()
    
    // MARK: Dimensions
    let margins: UIEdgeInsets = .init(vertical: .x4, horizontal: .x16)
    let spacer: CGFloat = .x12
    let imageHeight: CGFloat = .x96
    let imageToLabelSpace: CGFloat = .x12
    lazy var stackHeight: CGFloat = similarHero1.layoutMargins.top
        + imageHeight + imageToLabelSpace + similarHero1.label.font.lineHeight
        + similarHero1.layoutMargins.bottom
    
    override func moleculeWillLayout() {
        contentView.backgroundColor = .white
    }
    
    override func layoutContent(_ layout: LayoutInsertable) {
        layout.put(label)
            .at(.topLeft, .equalTo(margins), to: .parent)
        layout.put(hStack)
            .centerX(.equal, to: .parent)
            .at(.fullBottom, .equalTo(margins), to: .parent)
            .top(.equalTo(spacer), to: label.bottomAnchor)
            .height(.equalTo(stackHeight))
            .layoutContent { stack in
                stack.putStacked(similarHero1)
                stack.putStacked(similarHero2)
                stack.putStacked(similarHero3)
        }
    }
    
    class Model: TableViewCellModel<SimilarHeroCell> {
        @ObservableState var hero1: Hero?
        @ObservableState var hero2: Hero?
        @ObservableState var hero3: Hero?
        @ObservableState var heroImage1: ImageConvertible?
        @ObservableState var heroImage2: ImageConvertible?
        @ObservableState var heroImage3: ImageConvertible?
        @ViewState var heroName1: String?
        @ViewState var heroName2: String?
        @ViewState var heroName3: String?
        
        var didTapHero: ((Hero) -> Void)?
        
        override func bind(with view: SimilarHeroCell) {
            super.bind(with: view)
            $hero1.observe(observer: self).didSet { model, changes in
                model.heroName1 = changes.new?.localizedName
                model.heroImage1 = changes.new?.imageURL
            }
            $hero2.observe(observer: self).didSet { model, changes in
                model.heroName2 = changes.new?.localizedName
                model.heroImage2 = changes.new?.imageURL
            }
            $hero3.observe(observer: self).didSet { model, changes in
                model.heroName3 = changes.new?.localizedName
                model.heroImage3 = changes.new?.imageURL
            }
            $heroImage1.observe(observer: self).didSet { model, changes in
                view.similarHero1.photoImage.imageConvertible = changes.new
            }
            $heroImage2.observe(observer: self).didSet { model, changes in
                view.similarHero2.photoImage.imageConvertible = changes.new
            }
            $heroImage3.observe(observer: self).didSet { model, changes in
                view.similarHero3.photoImage.imageConvertible = changes.new
            }
            $heroName1.bind(with: view.similarHero1.label, \.text)
            $heroName2.bind(with: view.similarHero2.label, \.text)
            $heroName3.bind(with: view.similarHero3.label, \.text)
            view.similarHero1.hoverButton.didClicked { [weak self] _ in
                guard let self = self, let hero = self.hero1 else { return }
                self.didTapHero?(hero)
            }
            view.similarHero2.hoverButton.didClicked { [weak self] _ in
                guard let self = self, let hero = self.hero2 else { return }
                self.didTapHero?(hero)
            }
            view.similarHero3.hoverButton.didClicked { [weak self] _ in
                guard let self = self, let hero = self.hero3 else { return }
                self.didTapHero?(hero)
            }
        }
    }
}
