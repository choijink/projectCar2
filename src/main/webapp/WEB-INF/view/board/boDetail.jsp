<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>게시물 상세보기 | JingkaWingka</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: #01d28e;
            --secondary-color: #1089ff;
            --dark-color: #000;
            --light-color: #f8f9fa;
            --gray-color: #6c757d;
            --border-color: #dee2e6;
        }

        body {
            font-family: 'Noto Sans KR', sans-serif;
            line-height: 1.6;
            color: #333;
            background-color: #f8f9fa;
        }

        .post-container {
            max-width: 900px;
            margin: 3rem auto;
            background: white;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.08);
            overflow: hidden;
        }

        .post-header {
            background: linear-gradient(45deg, #01d28e, #1089ff);
            color: white;
            padding: 2rem;
            position: relative;
        }

        .post-category {
            display: inline-block;
            background: rgba(255,255,255,0.2);
            padding: 0.3rem 1rem;
            border-radius: 20px;
            font-size: 0.9rem;
            margin-bottom: 1rem;
        }

        .post-title {
            font-size: 2rem;
            font-weight: 700;
            margin-bottom: 1rem;
        }

        .post-meta {
            display: flex;
            gap: 2rem;
            font-size: 0.9rem;
            color: rgba(255,255,255,0.9);
        }

        .post-meta i {
            margin-right: 0.5rem;
        }

        .post-content {
            padding: 2rem;
        }

        .post-text {
            font-size: 1.1rem;
            line-height: 1.8;
            color: #444;
            margin-bottom: 2rem;
        }

        .post-images {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 1rem;
            margin-bottom: 2rem;
        }

        .post-image {
            border-radius: 10px;
            overflow: hidden;
        }

        .post-image img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }

        .post-actions {
            display: flex;
            gap: 1rem;
            padding: 1rem 2rem;
            border-top: 1px solid var(--border-color);
            background: #f8f9fa;
        }

        .action-btn {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            padding: 0.5rem 1rem;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .like-btn {
            background-color: #ff4757;
            color: white;
        }

        .share-btn {
            background-color: #1089ff;
            color: white;
        }

        .comment-section {
            padding: 2rem;
            background: white;
            margin-top: 2rem;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.08);
        }

        .comment-form {
            margin-bottom: 2rem;
        }

        .comment-input {
            width: 100%;
            padding: 1rem;
            border: 1px solid var(--border-color);
            border-radius: 10px;
            resize: none;
            margin-bottom: 1rem;
        }

        .comment-list {
            display: flex;
            flex-direction: column;
            gap: 1.5rem;
        }

        .comment {
            display: flex;
            gap: 1rem;
        }

        .comment-avatar {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            background-color: var(--primary-color);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: bold;
        }

        .comment-content {
            flex: 1;
        }

        .comment-header {
            display: flex;
            justify-content: space-between;
            margin-bottom: 0.5rem;
        }

        .comment-author {
            font-weight: 500;
        }

        .comment-date {
            color: var(--gray-color);
            font-size: 0.9rem;
        }

        .comment-text {
            color: #444;
            line-height: 1.6;
        }

        .navigation-buttons {
            display: flex;
            justify-content: space-between;
            margin-top: 2rem;
            padding: 0 2rem;
        }

        .nav-btn {
            padding: 0.5rem 1rem;
            border: 1px solid var(--primary-color);
            border-radius: 5px;
            color: var(--primary-color);
            text-decoration: none;
            transition: all 0.3s ease;
        }

        .nav-btn:hover {
            background-color: var(--primary-color);
            color: white;
        }

    </style>
</head>
<body>
    <div class="post-container">
        <div class="post-header">
            <span class="post-category">자유게시판</span>
            <h1 class="post-title">차쟁이 고수님들 알려주세요 ㅠㅠ</h1>
            <div class="post-meta">
                <span><i class="fas fa-user"></i> 김영현</span>
                <span><i class="fas fa-calendar"></i> 2024-10-15</span>
                <span><i class="fas fa-eye"></i> 조회수 200</span>
                <span><i class="fas fa-comments"></i> 댓글 2</span>
            </div>
        </div>

        <div class="post-content">
            <div class="post-text">
                <p>안녕하세요! 저는 차량에 대해 잘 모르는 초보 운전자입니다. 
                최근에 제 차에서 이상한 소리가 나기 시작했는데, 
                엔진 쪽에서 '딸깍딸깍' 하는 소리가 간헐적으로 들립니다.</p>
                
                <p>주행할 때는 특별히 문제가 없는 것 같은데, 
                신호 대기할 때나 시동을 걸 때 특히 소리가 심해지는 것 같아요.
                혹시 이런 증상을 겪어보신 분 계신가요?</p>
                
                <p>차종은 2020년식 현대 아반떼입니다.
                조언 부탁드립니다! 🙏</p>
            </div>

            <div class="post-images">
                <div class="post-image">
                    <img src="images/car-10.jpg" alt="차량 사진 1">
                </div>
                <div class="post-image">
                    <img src="images/car-11.jpg" alt="차량 사진 2">
                </div>
            </div>
        </div>

        <div class="post-actions">
            <button class="action-btn like-btn">
                <i class="fas fa-heart"></i>
                <span>좋아요 15</span>
            </button>
            <button class="action-btn share-btn">
                <i class="fas fa-share"></i>
                <span>공유하기</span>
            </button>
        </div>
    </div>

    <div class="comment-section">
        <h3>댓글 2개</h3>
        <div class="comment-form">
            <textarea class="comment-input" rows="3" placeholder="모든 댓글은 서로 존중하는 마음으로 작성해 주세요. 비방, 욕설, 또는 타인을 상처 입히는 내용은 삼가해 주시기 바랍니다."></textarea>
            <button class="action-btn" style="background-color: var(--primary-color); color: white;">
                댓글 작성
            </button>
        </div>

        <div class="comment-list">
            <div class="comment">
                <div class="comment-avatar">
                    JK
                </div>
                <div class="comment-content">
                    <div class="comment-header">
                        <span class="comment-author">김재관</span>
                        <span class="comment-date">2024-10-15 14:30</span>
                    </div>
                    <p class="comment-text">
                        말씀하신 증상은 타이밍 벨트 쪽에서 발생하는 소리일 가능성이 높습니다. 
                        가까운 정비소에서 점검을 받아보시는 것을 추천드립니다. 
                        방치하시면 더 큰 문제가 될 수 있어요.
                    </p>
                </div>
            </div>

            <div class="comment">
                <div class="comment-avatar">
                    SJ
                </div>
                <div class="comment-content">
                    <div class="comment-header">
                        <span class="comment-author">선진우</span>
                        <span class="comment-date">2024-10-15 15:45</span>
                    </div>
                    <p class="comment-text">
                        저도 비슷한 경험이 있었는데, 엔진오일 교체 시기가 된 것일 수도 있습니다.
                        주행거리가 어느 정도 되시나요?
                    </p>
                </div>
            </div>
        </div>
    </div>

    <div class="navigation-buttons">
        <a href="#" class="nav-btn"><i class="fas fa-arrow-left"></i> 이전글</a>
        <a href="boList" class="nav-btn">목록으로</a>
        <a href="#" class="nav-btn">다음글 <i class="fas fa-arrow-right"></i></a>
    </div>
</body>
</html>
