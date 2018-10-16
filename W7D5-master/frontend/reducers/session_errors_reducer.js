import { RECEIVE_CURRENT_USER, RECEIVE_ERRORS } from '../actions/session_actions';
import { merge } from 'lodash';

const _errors = {
  session: []
};

const sessionErrorsReducer = (state = _errors, action) => {
  Object.freeze(state);

  switch (action.type) {
    case RECEIVE_ERRORS:
      return merge({}, { errors: action.errors });
    case RECEIVE_CURRENT_USER:
      return _errors;
    default:
      return state;
  }
};

export default sessionErrorsReducer;
