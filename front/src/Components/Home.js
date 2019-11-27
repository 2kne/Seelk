import React, {Component} from 'react';

class Home extends Component {

    render() {
            if (localStorage.getItem('token') === null)
            {
                return (
                    <div className="container">
                        <div className='row'>
                            <div className="col-xl-5 col-sm-12 mx-auto d-block">
                                <div className="d-flex justify-content-around mt-5">
                                    <a href="/inscription">
                                        <button className="btn btn-primary btn-lg">Inscription</button>
                                    </a>
                                    <a href="/connexion">
                                        <button className="btn btn-primary btn-rounded btn-lg">Connexion</button>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                )
            }
            else
            {
                return (
                    <div className="container">
                        <div className='row'>
                            <div className="col-xl-5 col-sm-12 mx-auto d-block">
                                <div className="">
                                    <a href="/alert/list">
                                    <button className="btn btn-success">Mes alertes</button>
                                    </a>
                                    <a href="/alert/new">
                                        <button className="btn btn-success">Creer une alerte</button>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                )
            }

    }
}

export default Home;
