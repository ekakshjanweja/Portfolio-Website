import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:portfolio_website/common/services/graphql_config.dart';
import 'package:portfolio_website/models/post_model.dart';

final gqlServicesProvider = Provider<GraphQLServices>(
  (ref) => GraphQLServices(),
);

final getPostsProivder = FutureProvider<List<PostModel>>((ref) async {
  return GraphQLServices().getPosts();
});

class GraphQLServices {
  static GraphQLConfig graphQLConfig = GraphQLConfig();

  GraphQLClient client = graphQLConfig.clientToQuery();

  //Get Posts

  Future<List<PostModel>> getPosts() async {
    try {
      QueryResult result = await client.query(QueryOptions(
        fetchPolicy: FetchPolicy.noCache,
        document: gql("""{
  user(username: "stormej") {
    publication {
      posts(page: 0) {
        _id
        cuid
        coverImage
        title
        contentMarkdown
      }
    }
  }
}"""),
      ));

      if (result.hasException) {
        throw Exception(result.exception);
      }

      List? res = result.data?['user']['publication']['posts'];

      if (res == null || res.isEmpty) {
        return [];
      }

      List<PostModel> posts =
          res.map((post) => PostModel.fromMap(post)).toList();

      return posts;
    } catch (e) {
      throw Exception(e);
    }
  }
}
