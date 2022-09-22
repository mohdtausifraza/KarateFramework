package learn.post;


import com.intuit.karate.junit5.Karate;

public class PostRunner {
  @Karate.Test
  Karate runPost(){
    return Karate.run(
        "createJobEntry",
        "schemaValidation",
        "javaScriptExecutor").relativeTo(getClass());
  }
}
