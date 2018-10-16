import React from 'react';
// Presentational component check ajax call
class PokemonDetail extends React.Component {

  componentDidMount() {
    this.props.requestPoke(this.props.match.params.pokemonId);
  }

  componentWillReceiveProps(newProps) {
    if (this.props.match.params.pokemonId !== newProps.match.params.pokemonId) {
      this.props.requestPoke(newProps.match.params.pokemonId);
    }
  }

  render() {
    return (
      <div>
        <ul>
          <li>Hello</li>
        </ul>
      </div>
    );
  }
}

export default PokemonDetail;
