package halonen.bookstore.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import halonen.bookstore.domain.Book;
import halonen.bookstore.domain.Like;
import halonen.bookstore.domain.LikeRepository;
import halonen.bookstore.domain.User;
import jakarta.transaction.Transactional;

@Service
public class LikeService {
	private final LikeRepository likeRepository;

	@Autowired
	public LikeService(LikeRepository likeRepository) {
		this.likeRepository = likeRepository;
	}

	@Transactional
	public boolean userHasLikedBook(Book book, String username) {
		List<Like> likes = likeRepository.findByUser_UsernameAndBook_Id(username, book.getId());
		return !likes.isEmpty();
	}

	@Transactional
	public void unlikeBook(User currentUser, Book book) {
		likeRepository.deleteByUserAndBook(currentUser, book);
	}
}
