import {connect} from 'react-redux';

import {requestAllPokemon} from '../../actions/pokemon_actions';
import {selectAllPokemon} from '../../reducers/selectors';

import PokemonIndex from './pokemon_index';



const mapStateToProps = state => ({
  // piece of the pie
  pokemon: selectAllPokemon(state)
});

const mapDispatchToProps = dispatch => ({
  requestAllPokemon: () => dispatch(requestAllPokemon())//dispatch requestAllPokemon function
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(PokemonIndex);
