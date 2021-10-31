import React, {useState, useEffect} from "react";
import axios from "axios";

const Article = (props) => {
  const [article, setArticle] = useState({});
  const [comments, setComments] = useState({});

  useEffect(() => {
    const url = `/api/v1/articles/${props.match.params.id}`;

    axios.get(url)
    .then(response => setArticle(response.data))
    .catch(response => console.log(response));
  }, [])
 
  return (
    <div>
      {console.log(article)}
    </div>
  );
}

export default Article;