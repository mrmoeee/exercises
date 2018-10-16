import merge from 'lodash/merge';
import { RECEIVE_POKE } from '../actions/pokemon_actions';

const itemsReducer = (state= {}, action) => {
  Object.freeze(state);
  let newState =merge({}, state);
  switch(action.type) {
    case RECEIVE_POKE:
      return merge(newState, action.payload.items);
    default:
      return state;
  }
};

export default itemsReducer;
