import {connect} from 'react-redux';
import {requestPoke} from '../../actions/pokemon_actions';
import PokemonDetail from './pokemon_detail';
import {selectPoke} from '../../reducers/selectors';

const mapStateToProps = (state, {match: {params: {pokemonId}} }) => {
  // piece of the pie
  return {poke: selectPoke(state, pokemonId)};
};

const mapDispatchToProps = dispatch => ({
  requestPoke: (pokemonId) => dispatch(requestPoke(pokemonId))//dispatch requestAllPokemon function
});


export default connect(
  mapStateToProps,
  mapDispatchToProps
)(PokemonDetail);
