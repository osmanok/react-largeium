import React, { useState, useEffect, Fragment } from "react";
import axios from "axios";

import Article from "./Article";


const Articles = () => {
  const [articles, setArticles] = useState([]);

  useEffect(() => {
    axios.get('/api/v1/articles.json')
    .then( response => {
      setArticles(response.data.data);
    })
    .catch( error => {
      console.log(error);
    }); 
  }, [])

  const grid = articles.map( article => {
    return (
      <Article 
        key = {article.id}
        attributes = {article.attributes}
      />
    )
  })

  return (
    <div className="Home">
      <div className="header">
        <h1>ReLargeium</h1>
        <div className="subheader">Larger than others</div>
      </div>
      <div className="grid">
        <ul>{grid}</ul>
      </div>
    </div>
  );
}

export default Articles;