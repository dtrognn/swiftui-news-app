//
//  BookmarkItemView.swift
//  news app
//
//  Created by dtrognn on 02/11/2023.
//

import SwiftUI

struct BookmarkItemView: View {
    @ObservedObject var data: ArticleItemViewData
    var onDelete: ((ArticleItemViewData) -> Void)?
    var onAction: (ArticleItemViewData) -> Void
    
    init(data: ArticleItemViewData, onDelete: ( (ArticleItemViewData) -> Void)? = nil, onAction: @escaping (ArticleItemViewData) -> Void) {
        self.data = data
        self.onDelete = onDelete
        self.onAction = onAction
    }

    var body: some View {
        ZStack {
            AppConfig.theme.backgroundColor

            Button {
                onAction(data)
            } label: {
                VStack(spacing: AppConfig.layout.zero) {
                    VStack(alignment: .leading, spacing: AppConfig.layout.mediumSpace) {
                        image
                        titleText
                        descriptionText
                        HStack(spacing: AppConfig.layout.zero) {
                            authorView
                            Spacer()
                            HStack {
                                deleteButton
                                sharedButton
                            }
                        }
                    }.padding(.all, AppConfig.layout.standardSpace)
                        .background(AppConfig.theme.rowCommonBackgroundColor)
                        .cornerRadius(AppConfig.layout.standardCornerRadius)
                }
            }
        }
    }
}

private extension BookmarkItemView {
    var titleText: some View {
        return Text(data.title)
            .font(AppConfig.font.regular16)
            .foregroundColor(AppConfig.theme.textNormalColor)
            .multilineTextAlignment(.leading)
            .lineLimit(2)
    }

    var descriptionText: some View {
        return Text(data.description)
            .font(AppConfig.font.regular14)
            .foregroundColor(AppConfig.theme.textNoteColor)
            .multilineTextAlignment(.leading)
            .lineLimit(3)
    }

    var image: some View {
        ImageURL(url: data.urlToImage)
    }

    var authorView: some View {
        return HStack(spacing: AppConfig.layout.smallSpace) {
            authorImage
            authorText
            dash
            timeText
        }
    }

    var authorText: some View {
        return Text(data.source)
            .font(AppConfig.font.regular14)
            .foregroundColor(AppConfig.theme.textNoteColor)
            .multilineTextAlignment(.leading)
    }

    var authorImage: some View {
        return Image(systemName: "person")
            .resizable()
            .renderingMode(.template)
            .foregroundColor(AppConfig.theme.iconOffColor)
            .frame(width: 10, height: 10)
    }

    var dash: some View {
        return Text(" - ")
            .font(AppConfig.font.regular10)
            .foregroundColor(AppConfig.theme.textNoteColor)
            .multilineTextAlignment(.leading)
    }

    var timeText: some View {
        return Text("\(data.publishedAt)")
            .font(AppConfig.font.regular14)
            .foregroundColor(AppConfig.theme.textNoteColor)
            .multilineTextAlignment(.leading)
    }

    var deleteButton: some View {
        return Button {
            data.isBookMark.toggle()
            onDelete?(data)
        } label: {
            circleBackground.overlay(bookmarkImage)
        }
    }

    var bookmarkImage: some View {
        return Image(systemName: "trash")
            .applyTheme()
    }

    var sharedButton: some View {
        return Button {
            presentSharedSheet(data.url)
        } label: {
            circleBackground.overlay(sharedImage)
        }
    }

    var sharedImage: some View {
        return Image(systemName: "square.and.arrow.up")
            .applyTheme()
    }

    var circleBackground: some View {
        return Circle()
            .foregroundColor(AppConfig.theme.lineColor)
            .frame(width: 35, height: 35)
    }
}

#Preview {
    ArticleItemView(data: ArticleItemViewData(
        source: "Alexander Smith",
        title: "After she was freed, Israeli hostage offered a handshake to Hamas - NBC News",
        description: "After she was freed, Israeli hostage Yocheved Lifshitz offered a handshake to her Hamas captors.",
        url: "https://www.nbcnews.com/news/world/israeli-hostage-handshake-hamas-rcna121852",
        urlToImage: "https://media-cldnry.s-nbcnews.com/image/upload/t_nbcnews-fp-1200-630,f_auto,q_auto:best/rockcms/2023-10/231024-yocheved-lifshitz-press-conference-jm-0647-693270.jpg", publishedAt: ""
    ), onAction: { _ in })
}
