 export const fetchAllPokemon = () => {

  return $.ajax({
    type: 'GET',
    url: 'api/pokemon'
  });
};

export const fetchPoke = (id) => {
  return $.ajax({
    type: 'GET',
    url: `api/pokemon/${id}`
  });
};
