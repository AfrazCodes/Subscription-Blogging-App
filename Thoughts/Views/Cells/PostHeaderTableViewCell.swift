//
//  PostHeaderTableViewCell.swift
//  Thoughts
//
//  Created by Afraz Siddiqui on 8/5/21.
//

import UIKit

class PostHeaderTableViewCellViewModel {
    let imageUrl: URL?
    var imageData: Data?

    init(imageUrl: URL?) {
        self.imageUrl = imageUrl
    }
}

class PostHeaderTableViewCell: UITableViewCell {
    static let identifier = "PostHeaderTableViewCell"

    private let postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.clipsToBounds = true
        contentView.addSubview(postImageView)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        postImageView.frame = contentView.bounds
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        postImageView.image = nil
    }

    func configure(with viewModel: PostHeaderTableViewCellViewModel) {
        if let data = viewModel.imageData {
            postImageView.image = UIImage(data: data)
        }
        else if let url = viewModel.imageUrl {
            // Fetch image & cache
            let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
                guard let data = data else {
                    return
                }

                viewModel.imageData = data
                DispatchQueue.main.async {
                    self?.postImageView.image = UIImage(data: data)
                }
            }
            task.resume()
        }
    }
}
