import 'package:bloc_pattern/infinite_list_module/rep/post.dart';
import 'package:equatable/equatable.dart';

/***
 * Our representation level must have several types of information to meet the correct requirements: 

  PostUninitialized-tells the view layer that it needs to 
  visualize the loading indicator while the initial part of messages is being loaded.
  
  PostLoaded-notifies the view layer that it has content to render 
  
  posts-will be a list of List<Post> objects that will be displayed
  hasReachedMax-tells the view layer whether it has reached the maximum number of posts
  PostError-notifies the view layer that an error occurred when receiving messages
 */

abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

class PostUninitialized extends PostState {}

class PostError extends PostState {}

class PostLoaded extends PostState {
  final List<Post> posts;
  final bool hasReachedMax;

  const PostLoaded({
    this.posts,
    this.hasReachedMax,
  });

  //We implemented copyWith so that we can copy a PostLoaded instance and 
  //selectively update its properties (this will come in handy later).
  PostLoaded copyWith({
    List<Post> posts,
    bool hasReachedMax,
  }) {
    return PostLoaded(
      posts: posts ?? this.posts,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [posts, hasReachedMax];

  @override
  String toString() =>
      'PostLoaded { posts: ${posts.length}, hasReachedMax: $hasReachedMax }';
}