class Environments {
  static const baseURL = String.fromEnvironment(
    'jsonplaceholder',
    defaultValue: 'jsonplaceholder.typicode.com',
  );

  static const users = String.fromEnvironment(
    'users',
    defaultValue: '/users',
  );

  static const todos = String.fromEnvironment(
    'todos',
    defaultValue: '/todos',
  );

  static const albums = String.fromEnvironment(
    'albums',
    defaultValue: '/albums',
  );

  static const comments = String.fromEnvironment(
    'comments',
    defaultValue: '/comments',
  );

  static const posts = String.fromEnvironment(
    'posts',
    defaultValue: '/posts',
  );

  static const photos = String.fromEnvironment(
    'photos',
    defaultValue: '/photos',
  );
}
