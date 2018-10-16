import React from 'react';
import { Link } from 'react-router-dom';


export const PokemonIndexItem = ({poke}) => {
  const linkUrl = `/pokemon/${poke.id}`;
    return (
      <li>
        <Link to={linkUrl}>
          <img src={poke.image_url}></img>
          {poke.name}
        </Link>
      </li>
    );
};
