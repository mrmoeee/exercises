import {values} from 'lodash';

export const selectAllPokemon = (state) => {
  return values(state.entities.pokemon);
};

export const selectPoke = (state, id) => {
  return state.entities.pokemon[id];
};
