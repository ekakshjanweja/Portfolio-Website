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
        document: gql("""query Publication {
  publication(host: "stormej.hashnode.dev") {
    posts(first: 10) {
      edges {
        node {
          title
          coverImage {
            url
          }
          content {
            markdown
          }
        }
      }
    }
  }
}"""),
      ));

      if (result.hasException) {
        throw Exception(result.exception);
      }

      List res = result.data!['publication']['posts']['edges'];

      List<PostModel> posts =
          res.map((post) => PostModel.fromMap(post)).toList();

      return posts;
    } catch (e) {
      throw Exception(e);
    }
  }
}
