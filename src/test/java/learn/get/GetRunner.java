package learn.get;


import com.intuit.karate.junit5.Karate;

public class GetRunner {
  @Karate.Test
  Karate runTest(){
    return Karate.run(
        "getRequest",
        "responseMatcher",
        "validateJsonArray",
        "validateXMLArray",
        "validateUsingFuzzyMatchers",
        "variable",
        "validateUsingFile").relativeTo(getClass());
  }

  /*@Karate.Test
  Karate runTestWithClassPath(){
    return Karate.run("classpath:learn/get/getRequest.feature");
  }*/
}
