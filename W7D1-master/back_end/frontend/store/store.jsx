import {createStore} from 'redux';
import rootReducer from '../reducers/root_reducer';
import {applyMiddleware} from 'redux';
import {thunk} from '../middleware/thunk';

const configureStore = () => {
  return createStore(rootReducer, applyMiddleware(thunk));
};

export default configureStore;
