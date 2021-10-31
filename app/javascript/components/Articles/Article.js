import React from "react";
import { Link } from "react-router-dom";

const Article = (props) => {
  return (
    <div className="article">
      <h1>{props.attributes.title}</h1>
      <p>{props.attributes.content}</p>
      <Link to={`/articles/${props.attributes.id}`}>Read More</Link>
    </div>
  );
}

export default Article;