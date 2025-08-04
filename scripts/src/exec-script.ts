import { exec } from 'child_process';
import { config } from 'dotenv';
import invariant from 'tiny-invariant';
import yargs from 'yargs';
import { hideBin } from 'yargs/helpers';

config({ path: process.cwd() + '/secret/.env' });

invariant(process.env.KEY, 'Private key missing');

(async () => {
  const argv = await yargs(hideBin(process.argv))
    .option('network', {
      alias: 'n',
      type: 'string',
      description: 'Specify the network',
    })
    .option('file', {
      alias: 'f',
      type: 'string',
      description: 'Specify the path to the script to run',
    })
    .parse();

  const { network, file } = argv;

  invariant(file, 'File is required');

  process.env.WEB_3_NETWORK = network;

  const command = `tsx ./src/${file}.ts`;

  exec(command, (error, stdout) => {
    if (error) {
      console.error(`Error executing command: ${error}`);
      return;
    }
    console.warn(stdout);
  });
})();
