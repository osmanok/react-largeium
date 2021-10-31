import React from "react";
import {Route, Switch} from "react-router-dom";

import Articles from "./Articles/Articles";
import Article from "./Article/Article";

const App = () => {
  return (
    <Switch>
      <Route exact path="/" component={Articles} />
      <Route exact path="/articles/:id" component={Article} />

    </Switch> 
  )
}

export default App;